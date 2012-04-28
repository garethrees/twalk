# Twalk

Twalk displays tweets of your followers who are talking to one another.

The idea is that in some situations you may only want a [Twitter](http://twitter.com) feed that shows when your followers are t_w_alking to each other, rather than seeing their random tweets to no one.

## Installation

Although you can get nicknames as you please, I've used the following

    gem 'twitter       # To get tweets
    gem 'twalk'
    gem 'twitter-text' # To format tweets

## Usage

```ruby
nicknames = %w(_gareth cardiffrb)
tweets = Twitter.home_timeline.collect { |tweet| tweet.text }

@twalks = Twalk.tweets_between(nicknames, tweets)

# your_view.html.erb
@twalks.each do |tweet|
  <div class="tweet">auto_link tweet.text</div>
end
```    

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
