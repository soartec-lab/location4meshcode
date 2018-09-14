# Installation

Add this line to your application's Gemfile:

```ruby
gem 'location4meshcode'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install location4meshcode

# usage

## params

### class.new

Location4meshcode::Point.new(latitude, longitude)

### method

location.meshcode(level: 1)
level is mesh map code

```ruby
location = Location4meshcode::Point.new('35.7007777','139.71475')
location.meshcode(level: 1)
#=> "5339"

location.meshcode(level: 2)
#=> "533945"

location.meshcode(level: 3)
#=> "533947"
```