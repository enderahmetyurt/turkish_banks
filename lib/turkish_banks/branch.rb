module TurkishBanks
  class Branch < TurkishBank
    attr_accessor :name, :code, :bank_code, :city
    
    def initialize branch
      @name      = branch["sAd"]
      @code      = branch["sKd"]
      @bank_code = branch["bKd"]
      @city      = branch["bIlAd"]
    end
  end
end