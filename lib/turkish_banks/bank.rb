module TurkishBanks
  class Bank < TurkishBank
    attr_accessor :name, :code, :city, :address

    def initialize(bank)
      @name    = bank["bAd"]
      @code    = bank["bKd"]
      @city    = bank["bIlAd"]
      @address = bank["adr"]
    end
  end
end