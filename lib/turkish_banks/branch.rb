module TurkishBanks
  class Branch < TurkishBank
    attr_accessor :name, :code, :bank_code, :city_code, :city, :district_code, :district, :phone

    def initialize(branch)
      @name          = branch["sAd"]
      @code          = branch["sKd"]
      @bank_code     = branch["bKd"]
      @city_code     = branch["sIlKd"]
      @city          = branch["sIlAd"]
      @district_code = branch["sIlcKd"]
      @district      = branch["sIlcAd"]
      @phone         = branch["tlf"]
    end
  end
end
