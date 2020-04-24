module TurkishBanks
  class TurkishBank
    attr_accessor :last_update_date, :banks

    BANKS_URL = "http://eftemkt.tcmb.gov.tr/bankasubelistesi/bankaSubeTumListe.xml".freeze

    def initialize
      doc = Nokogiri.XML(::OpenURI.open_uri(BANKS_URL), nil, 'UTF-8')
      doc.remove_namespaces!
      response          = Hash.from_xml(doc.to_s)
      @last_update_date = response["bankaSubeTumListe"]["tarih"]
      @banks            = response["bankaSubeTumListe"]["bankaSubeleri"]
    end

    def get_information_of(bank_name)
      return "#{bank_name} isminde bir banka bulunamadı." if get_bank(bank_name).empty?

      bank = get_bank(bank_name).first["banka"]
      TurkishBanks::Bank.new bank
    end

    def get_branches_of(bank_name)
      return "#{bank_name} isminde bir bankaya ait şube bilgisi bulunamadı." if get_bank(bank_name).empty?

      bank_branches = []
      branches = get_bank(bank_name).first["sube"]
      branches.each do |branch|
        bank_branches << TurkishBanks::Branch.new(branch)
      end
      bank_branches
    end

    private

    def get_bank(bank_name)
      @banks.select {|b| b["banka"]["bAd"] == bank_name.upcase(:turkic)}
    end
  end
end
