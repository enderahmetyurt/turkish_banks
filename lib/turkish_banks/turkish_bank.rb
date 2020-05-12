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

    def get_branches_of(bank_name, city_name = nil, district_name = nil)
      return "#{bank_name} isminde bir bankaya ait şube bilgisi bulunamadı." if get_bank(bank_name).empty?

      branches = get_bank(bank_name).first["sube"]
      bank_branches = get_branches(branches, city_name, district_name)
      bank_branches.empty? ? bank_branch_not_found(bank_name,city_name,district_name) : bank_branches
    end

    private

    def get_bank(bank_name)
      @banks.select {|b| b["banka"]["bAd"] == bank_name.upcase(:turkic)}
    end

    def get_branches(branches, city_name, district_name)
      bank_branches = []
      branches.each do |branch|
        if city_name.present? && district_name.present?
          bank_branches << TurkishBanks::Branch.new(branch) if branch["sIlAd"] == city_name && branch["sIlcAd"] == district_name
        elsif city_name.present?
          bank_branches << TurkishBanks::Branch.new(branch) if branch["sIlAd"] == city_name
        else
          bank_branches << TurkishBanks::Branch.new(branch)
        end
      end
      bank_branches
    end

    def bank_branch_not_found(bank_name,city_name,district_name)
      if city_name.present? && district_name.present?
        "#{city_name} ili #{district_name} ilçesinde #{bank_name}'ye ait şube bilgisi bulunamadı."
      else
        "#{city_name} ilinde #{bank_name}'ye ait şube bilgisi bulunamadı."
      end
    end
  end
end
