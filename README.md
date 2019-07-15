# DashaMailRb

This gem provides you with simple Ruby interface for Dashamail.ru ESP.

Documentation available at https://www.rubydoc.info/github/Dashamail/DashamailRb

Original API documentation https://dashamail.ru/api/

At this moment, mainly list management features implemented, but there are common way to call any API method, using *#call_method*

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'DashaMailRb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install DashaMailRb

## Usage

DashamailRb declares some classes for API objects, like *List*, *Member*, etc

require "DashaMailRb"
conn = Dashamail::Connection.new('login', 'password')
conn.lists # => Array of Dashamail::List instances

Optionally you can additionally pass third parameter to Dashamail::Connection constructor, to change API url (for example if you plan to use compatible service):

conn = Dashamail::Connection.new('login', 'password', 'https://api.dashamail.com')


Also, you can use universal invocation method with *#call_method*

conn.call_method('lists.get_members', list_id: 1)

## Contributing

1. Fork it ( https://github.com/DashaMail/DashamailRb )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
