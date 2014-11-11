# GonResponder

GonResponder module for responders gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gon_responder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gon_responder

## Usage

Add GonResponder module to your ApplicationResponder like this:

```ruby
class ApplicationResponder < ActionController::Responder

  include Responders::FlashResponder
  include Responders::HttpCacheResponder
  include Responders::GonResponder
end
```

Now you're ready to respond_with gon:

```ruby
class PostsController < ApplicationController
  respond_to :html, :json

  def index
    @posts = Post.all
    respond_with @posts, gon: { rabl: { as: :posts }}
  end

```

You should add `gon` options hash to respond_with.

#### Example

```ruby
respond_with @posts, gon: { :posts= => @posts }
```
Which equals to

```ruby
gon.posts = @posts
```

#### Another example

```ruby
respond_with @posts, gon: { push: { user_id: 1, user_role: "admin" } }
```

Which equals to

```ruby
gon.push({ :user_id => 1, :user_role => "admin" })
```

#### RablRails example

```ruby
respond_with @posts, gon: :rabl
```

Which equals to

```ruby
gon.rabl
```

#### Another RablRails example

```ruby
respond_with @posts, gon: { rabl: { template: 'app/views/posts/index.json.rabl', as: :posts } }
```

Which equals to

```ruby
gon.rabl template: 'app/views/posts/index.json.rabl', as: :posts
```

## Contributing

1. Fork it ( https://github.com/kressh/gon_responder/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
