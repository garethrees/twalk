# Twalk

Twalk displays tweets of your followers who are talking to one another.

The idea is that in some situations you may only want a [Twitter](http://twitter.com) feed that shows when your followers are t_w_alking to each other, rather than seeing their random tweets to no one.

## Installation

Add this line to your application's Gemfile:

    gem 'twalk'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install twalk

## Usage

```ruby

# your_controller.rb
users = User.all.collect { |user| user.nickname }
users = %w(_gareth cardiffrb)

@tweets = Twalk::Twalk.tweets_between(users)

# your_view.html.erb
@tweets.each do |tweet|
  <div class="tweet">auto_link tweet.text</div>
end
```    

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
