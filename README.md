# TurkishBanks 

[![Gem Version](https://badge.fury.io/rb/turkish_banks.svg)](http://badge.fury.io/rb/turkish_banks)
[![Code Climate](https://codeclimate.com/github/enderahmetyurt/turkish_support/badges/gpa.svg)](https://codeclimate.com/github/enderahmetyurt/turkish_support)

Fetch all banks and their information from http://www.tcmb.gov.tr/.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'turkish_banks'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install turkish_banks

## Usage

```ruby
turkish_bank = TurkishBanks::TurkishBank.new
# Get last update date
turkish_bank.last_update_date
# Get all banks
turkish_bank.banks
# Get information of a bank with the name
turkish_bank.get_information_of "turkiye cumhuriyeti ziraat bankası a.ş."
# Get branch of the the bank
turkish_bank.get_branches_of "turkiye cumhuriyeti ziraat bankası a.ş."
```    

## TODO

* Improve search part.
* New features. Please send some pull-request.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/turkish_banks/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
