# PechkinRb

[![Code Climate](https://codeclimate.com/github/crsde/PechkinRb/badges/gpa.svg)](https://codeclimate.com/github/crsde/PechkinRb)

This gem provides you with easy Ruby interface for pechkin-mail.ru mail service.

Documentation available at http://www.rubydoc.info/github/crsde/PechkinRb

## Installation

Add this line to your application's Gemfile:

    gem 'pechkinrb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pechkinrb

## Usage

    require "pechkinrb"
    conn = Pechkin::Connection.new('login', 'password')
    conn.lists # => Array of Pechkin::List instances


## Contributing

1. Fork it ( https://github.com/[my-github-username]/pechkinrb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
