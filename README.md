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
# Creates a TurkishBank object
turkish_bank = TurkishBanks::TurkishBank.new

# Gets last update date
turkish_bank.last_update_date

# Gets all banks
turkish_bank.banks

# Returns a bank object
bank = turkish_bank.get_information_of "türkiye cumhuriyeti ziraat bankası a.ş."
bank.name # => TÜRKİYE CUMHURİYETİ ZIRAAT BANKASI A.Ş.

# Returns a collection of branch objectes
branches = turkish_bank.get_branches_of "türkiye cumhuriyeti ziraat bankası a.ş."
branches.first.name # => "ANKARA ŞUBESİ"
```    

## TODO

* Improve search part.
* New features. Please send some pull-request.
