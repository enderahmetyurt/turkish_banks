# frozen_string_literal: true

module TurkishBanks
  class Branch
    attr_reader :name, :code, :bank_code, :city_code,
                :city, :district_code, :district, :phone

    def initialize(branch_params)
      @name          = branch_params['sAd']
      @code          = branch_params['sKd']
      @bank_code     = branch_params['bKd']
      @city_code     = branch_params['sIlKd']
      @city          = branch_params['sIlAd']
      @district_code = branch_params['sIlcKd']
      @district      = branch_params['sIlcAd']
      @phone         = branch_params['tlf']
    end
  end
end
