# frozen_string_literal: true

module TurkishBanks
  class Bank
    attr_reader :name, :code, :city, :address

    def initialize(bank_name)
      bank_params = TurkishBanks.get_bank_params(bank_name)
      @name    = bank_params['bAd']
      @code    = bank_params['bKd']
      @city    = bank_params['bIlAd']
      @address = bank_params['adr']
    end

    def branches
      nodes = TurkishBanks::DOC.xpath("//sube[bKd= '#{@code}']")
      nodes.map do |node|
        branch_params = Hash.from_xml(node.to_s)['sube']
        TurkishBanks::Branch.new(branch_params)
      end
    end
  end
end
