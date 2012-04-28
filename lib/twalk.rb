require "twalk/version"

module Twalk

  class << self
    # Public: Return an Array of Strings where nicknames mention each other
    #
    # nicknames - the Array of String twitter nicknames to be scanned
    # tweets - the Array of Strings to be scanned
    #
    # Examples
    #
    # nicknames = %w(_gareth cardiffrb)
    # tweets = Twitter.home_timeline.collect { |tweet| tweet.text }
    #
    # tweets_between(nicknames, tweets)
    # # ...some processing...
    # # => @_gareth: hey @cardiffrb!
    # # => @cardiffrb: nice to meet you, @_gareth
    #
    # Returns an array of Strings
    def tweets_between(nicknames, tweets)
      tweets_to_show = []
      tweets.each do |tweet|
        nicknames.each do |user|
          tweets_to_show << tweet if tweet.downcase.include? user
        end
      end
      tweets_to_show.uniq
    end
  end

end
