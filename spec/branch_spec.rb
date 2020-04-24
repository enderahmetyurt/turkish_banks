require "spec_helper"

describe TurkishBanks::Branch do
  before(:all) do
    @tb = TurkishBanks::TurkishBank.new
  end

  context "#new" do
    it "creates a new brach object" do
      branches = @tb.get_branches_of "türkiye cumhuriyeti ziraat bankası a.ş."
      main_branch = branches.first
      expect(main_branch.name).to eq "MERKEZ/ANKARA ŞUBESİ"
      expect(main_branch.code).to eq "00001"
      expect(main_branch.bank_code).to eq "0010"
      expect(main_branch.city_code).to eq "006"
      expect(main_branch.city).to eq "ANKARA"
      expect(main_branch.district_code).to eq "0623"
      expect(main_branch.district).to eq "ALTINDAĞ"
      expect(main_branch.phone).to eq "+903123093170"
    end

    it "creates error message when there is no branch related with bank" do
      message = @tb.get_branches_of "gram altın oldu uzay bankası a.ş."
      expect(message).to eq "gram altın oldu uzay bankası a.ş. isminde bir bankaya ait şube bilgisi bulunamadı."
    end
  end  
end
