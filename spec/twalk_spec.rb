require 'minitest/spec'
require 'minitest/autorun'

path = File.expand_path(File.dirname(__FILE__) + "/../lib/")
$LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)
require "twalk"

describe Twalk do

  def setup
    @nicknames = %w(_gareth cardiffrb)
    @tweets = ["hello @_gareth", "hi there @cardiffrb", "Tweet to no one", "Hi @_gareth and @cardiffrb"]
  end

  it "should return tweets that mention a nickname" do
    Twalk::tweets_between(["@_gareth"], ["Hey @_gareth"]).size.must_equal 1
  end

  it "should not return tweets that do not mention a nickname" do
    Twalk::tweets_between(["@_gareth"], ["Hey @twitter"]).size.must_equal 0
  end

  it "should not return duplicate tweets for tweets that mention several nickname" do
    Twalk::tweets_between(["@_gareth", "@cardiffrb"], ["Hey @_gareth and @cardiffrb"]).size.must_equal 1
  end

  it "should not return duplicate tweets for tweets that mention the same nickname more than once" do
    Twalk::tweets_between(["@_gareth"], ["Hey @_gareth. How are you @_gareth?"]).size.must_equal 1
  end

  it "should return tweets that mention a known and unknown nickname" do
    Twalk::tweets_between(["@_gareth", "@twitter"], ["Hey @_gareth and @twitter"]).size.must_equal 1
  end

  it "should return multiple tweets that mention a nickname" do
    Twalk::tweets_between(["@_gareth"], ["Hey @_gareth", "Hello @_gareth"]).size.must_equal 2
  end

  it "should return multiple tweets that mention individual nicknames" do
    nicknames = ["@_gareth", "@cardiffrb"]
    tweets = ["Hey @_gareth", "Hello @cardiffrb"]
    Twalk::tweets_between(nicknames, tweets).size.must_equal 2
  end

  it "should return multiple tweets that mention individual nicknames, but not tweets to no one" do
    Twalk::tweets_between(["@_gareth"], @tweets).size.must_equal 2
  end

  it "should return mutiple tweets that mention multiple nicknames, but not tweets to no one" do
    Twalk::tweets_between(@nicknames, @tweets).size.must_equal 3
  end

end