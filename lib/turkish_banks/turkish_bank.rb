require "turkish_support"

module TurkishBanks
  class TurkishBank
    using TurkishSupport
    attr_accessor :last_update_date, :banks

    BANKS_URL = "http://eftemkt.tcmb.gov.tr/bankasubelistesi/bankaSubeTumListe.xml"

    def initialize
      doc = Nokogiri.XML(open(BANKS_URL), nil, 'UTF-8')
      doc.remove_namespaces!
      response = Hash.from_xml(doc.to_s)
      @last_update_date = response["bankaSubeTumListe"]["tarih"]
      @banks = response["bankaSubeTumListe"]["bankaSubeleri"]
    end

    def get_information_of bank_name
      bank = get_bank(bank_name).first["banka"]
      TurkishBanks::Bank.new bank
    end

    def get_branches_of bank_name
      branches = get_bank(bank_name).first["sube"]
      branches.each do |branch|
        TurkishBanks::Branch.new branch
      end
    end

    private

    def get_bank bank_name
      @banks.select {|b| b["banka"]["bAd"] == bank_name.upcase}
    end
  end
end
