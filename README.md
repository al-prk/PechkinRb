# PechkinRb

[![Code Climate](https://codeclimate.com/github/crsde/PechkinRb/badges/gpa.svg)](https://codeclimate.com/github/crsde/PechkinRb) [![Gem Version](https://badge.fury.io/rb/pechkinrb.svg)](http://badge.fury.io/rb/pechkinrb)

This gem provides you with simple Ruby interface for pechkin-mail.ru mail service.

Documentation available at http://www.rubydoc.info/github/crsde/PechkinRb

Original API documentation https://pechkin-mail.ru/api/

At this moment, mainly list management features implemented, but there are common way to call any API method, using *#call_method*

## Installation

Add this line to your application's Gemfile:

    gem 'pechkinrb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pechkinrb

## Usage

PechkinRb declares some classes for API objects, like *List*, *Member*, etc

    require "pechkinrb"
    conn = Pechkin::Connection.new('login', 'password')
    conn.lists # => Array of Pechkin::List instances

Also, you can use universal invocation method with *#call_method*

    conn.call_method('lists.get_members', list_id: 1)

## Contributing

1. Fork it ( https://github.com/crsde/PechkinRb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
