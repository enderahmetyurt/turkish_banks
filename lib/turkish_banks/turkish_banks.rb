module TurkishBanks
  class BankNotFoundError < StandardError
    def message
      'Banka bulunamadı.'
    end
  end

  BANKS_URL = 'http://eftemkt.tcmb.gov.tr/bankasubelistesi/bankaSubeTumListe.xml'.freeze
  DOC = Nokogiri
        .XML(::OpenURI.open_uri(BANKS_URL), nil, 'UTF-8')
        .remove_namespaces!.freeze
  LAST_UPDATE = DOC.at_xpath('//bankaSubeTumListe')['tarih'].freeze

  def self.get_bank_params(bank_name)
    node = DOC.at_xpath("//banka[bAd= '#{bank_name.upcase(:turkic)}']")
    raise BankNotFoundError if node.nil?

    Hash.from_xml(node.to_s)['banka']
  end

  def self.banks
    nodes = DOC.xpath('//banka')
    nodes.each.map { |node| Hash.from_xml(node.to_s)['banka'] }
  end
end
