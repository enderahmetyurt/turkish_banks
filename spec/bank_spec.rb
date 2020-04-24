require "spec_helper"

describe TurkishBanks::Bank do
  before(:all) do
    @tb = TurkishBanks::TurkishBank.new
  end

  context "#new" do
    it "creates a new bank object" do
      bank = @tb.get_information_of "türkiye cumhuriyeti ziraat bankası a.ş."
      expect(bank.name).to eq "TÜRKİYE CUMHURİYETİ ZİRAAT BANKASI A.Ş."
      expect(bank.code).to eq "0010"
      expect(bank.city).to eq "ANKARA"
      expect(bank.address).to eq "ANAFARTALAR MAHALLESİ ATATÜRK BULVARI NO:8 06050 ALTINDAĞ/ANKARA"
    end

    it "creates error message when bank name couldn't find" do
      message = @tb.get_information_of "yok böyle bir banka a.ş"
      expect(message).to eq "yok böyle bir banka a.ş isminde bir banka bulunamadı."
    end
  end
end
