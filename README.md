# QQ Client for Ruby

This gem si based in the gem [qq_17up](https://github.com/17up/qq_17up) made by [veggie](mailto:kkxlkkxllb@gmail.com).

The difference is that the configurations for the qq client is inside the rails configration in a ruby file instead of being stored in `/config/service.ym`.

This is the first step to build a gem to communicate with the qq connect open platform API.

The gem includes an strategy for connect qq via omniauth. 

## Installation

Add to your Gemfile:

```ruby
gem 'qq_client'
```

Then `bundle install`

Or install it yourself as:

```bash
$ gem install qq_client
```
## Setup

To configure the gem create the file `config/initializers/qq_client_config.rb` and add the configuration of the client.

Example:

```ruby
Rails.application.config.after_initialize do
  QQ_CONNECT_API_KEY = {API Key} unless defined?(QQ_CONNECT_API_KEY)
  QQ_CONNECT_API_SECRET = {API Secret} unless defined?(QQ_CONNECT_API_SECRET)
  QQ_CONNECT_REDIRECT_URI = {Callback redirect url} unless defined?(QQ_CONNECT_REDIRECT_URI)

  QqClient::Config.load_config(QQ_CONNECT_API_KEY, QQ_CONNECT_API_SECRET, QQ_CONNECT_REDIRECT_URI)
end
```

## OmniAuth configuration

To use qq_connect with devise omniauth please add to the `config/initializers/devise.rb`:

```ruby
  require 'omniauth/strategies/qq_connect'
  ...
  config.omniauth :qq_connect, ENV['TQQ_KEY'], ENV['TQQ_SECURT']
```

## Usage

Frst of all create a QqClient::Client with a access_token provided by qq. The you can start getting the info.

You must have the uid before. This elemtn is provided during the oauth flow.

```ruby
# Building the client for this spsecific user
client = QqClient::Client.new(access_token)

# Get Tencent Weibo user's login information.
# More info (http://wiki.connect.qq.com/get_info)
user_info = client.get_info(uid)

# Published a microblogging message (plain text) to the Tencent microblogging platforms.
# More info (http://wiki.connect.qq.com/add_t)
client.add_t(uid, 'Text message')

# Upload a picture and posted a message on the Tencent microblogging platforms.
# More info (http://wiki.connect.qq.com/add_pic_t)
client.add_pic_t(uid, 'Text message', pic)
```

## Contributing

1. Fork it
2. Create your feature branch => `git checkout -b my-new-feature`
3. Commit your changes => `git commit -am 'Added some feature'`
4. Push to the branch  => `git push origin my-new-feature`
5. Create new Pull Request

## License

The MIT License (MIT)

Copyright (c) 2014 Daniel Gonzàlez Lareo

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
