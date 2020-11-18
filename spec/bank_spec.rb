# frozen_string_literal: true

require 'spec_helper'

describe TurkishBanks::Bank do
  context '#new' do
    it 'creates a new bank object from a valid bank name' do
      valid_bank_name = 'türkiye cumhuriyeti ziraat bankası a.ş.'
      bank = TurkishBanks::Bank.new(valid_bank_name)

      expect(bank.name).to    eq 'TÜRKİYE CUMHURİYETİ ZİRAAT BANKASI A.Ş.'
      expect(bank.code).to    eq '0010'
      expect(bank.city).to    eq 'ANKARA'
      expect(bank.address).to eq 'ANAFARTALAR MAHALLESİ ATATÜRK BULVARI NO:8 06050 ALTINDAĞ/ANKARA'
    end

    it 'raises BankNotFoundError if bank does not exists' do
      invalid_bank_name = 'yok böyle bir banka a.ş'

      expect { TurkishBanks::Bank.new(invalid_bank_name) }
        .to raise_error(TurkishBanks::BankNotFoundError, 'Banka bulunamadı.')
    end
  end

  context '#branches' do
    it 'gets correct number of branches' do
      valid_bank_name = 'türkiye cumhuriyeti ziraat bankası a.ş.'
      bank = TurkishBanks::Bank.new(valid_bank_name)

      branch_size = TurkishBanks::DOC.at_xpath("//bankaSubeleri[@bKd='#{bank.code}']")['sAdt']
      expect(bank.branches.size).to eq(branch_size.to_i)
    end

    it 'gets correct info about branches' do
      valid_bank_name = 'türkiye cumhuriyeti ziraat bankası a.ş.'
      bank = TurkishBanks::Bank.new(valid_bank_name)
      branches = bank.branches

      main_branch = branches.first
      expect(main_branch.name).to          eq 'MERKEZ/ANKARA ŞUBESİ'
      expect(main_branch.code).to          eq '00001'
      expect(main_branch.bank_code).to     eq '0010'
      expect(main_branch.city_code).to     eq '006'
      expect(main_branch.city).to          eq 'ANKARA'
      expect(main_branch.district_code).to eq '0623'
      expect(main_branch.district).to      eq 'ALTINDAĞ'
      expect(main_branch.phone).to         eq '+900312309317'
    end
  end
end
