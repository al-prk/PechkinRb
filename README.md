# DashamailRb

[![Code Climate](https://codeclimate.com/github/crsde/dashamailRb/badges/gpa.svg)](https://codeclimate.com/github/crsde/dashamailRb) [![Gem Version](https://badge.fury.io/rb/dashamailrb.svg)](http://badge.fury.io/rb/dashamailrb)

This gem provides you with simple Ruby interface for dashamail.ru mail service.

Documentation available at https://github.com/DashaMail/DashamailRb

Original API documentation https://dashamail.ru/api/

At this moment, mainly list management features implemented, but there are common way to call any API method, using *#call_method*

## Installation

Add this line to your application's Gemfile:

    gem 'dashamailrb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dashamailrb

## Usage

dashamailRb declares some classes for API objects, like *List*, *Member*, etc

    require "dashamailrb"
    conn = Dashamail::Connection.new('login', 'password')
    conn.lists # => Array of Dashamail::List instances

Optionally you can additionally pass third parameter to dashamail::Connection constructor, to change API url (for example if you plan to use compatible service):

    conn = dashamail::Connection.new('login', 'password', 'https://api.dashamail.com')


Also, you can use universal invocation method with *#call_method*

    conn.call_method('lists.get_members', list_id: 1)

## Contributing

1. Fork it ( https://github.com/DashaMail/DashamailRb )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
