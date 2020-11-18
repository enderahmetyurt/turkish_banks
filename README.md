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
# Gets last update date
TurkishBanks::LAST_UPDATE

# Gets all banks
TurkishBanks.banks

# Create a bank from its name
bank = TurkishBanks::Bank.new("türkiye cumhuriyeti ziraat bankası a.ş.")
bank.name # => "TÜRKİYE CUMHURİYETİ ZIRAAT BANKASI A.Ş."

# Get a collection of branch objects
branches = bank.branches
branches.first.name # => "MERKEZ/ANKARA ŞUBESİ"
branches.size       # => 1791
```

## Exception Handling

If you pass the wrong bank name to `Bank#new`, it raises `TurkishBanks::BankNotFoundError` exception. You can rescue this error, then do something else.

```ruby
begin
  TurkishBanks::Bank.new('fake bank')
rescue TurkishBanks::BankNotFoundError
  # do something here
end
``` 

## TODO
* Improve search part.
* New features. Please send some pull-request.
