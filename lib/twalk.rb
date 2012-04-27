require "twalk/version"

module Twalk

  # Public: Return an Array of Tweets where users mention each other
  #
  # nicknames - the Array of twitter nicknames to be scanned
  # tweets - the Array of Tweets to be scanned
  #
  # Examples
  #
  # nicknames = %w(_gareth cardiffrb)
  # tweets = Twitter.home_timeline
  #
  # Twalk.tweets_between(nicknames, tweets)
  # # ...some processing...
  # # => @_gareth: hey @cardiffrb!
  # # => @cardiffrb: nice to meet you, @_gareth
  #
  # Returns an array of Tweets
  def self.tweets_between(nicknames, tweets)
    tweets_to_show = []
    tweets.each do |tweet|
      nicknames.each do |user|
        tweets_to_show << tweet if tweet.text.downcase.include? user
      end
    end
    tweets_to_show.uniq!
  end

end
