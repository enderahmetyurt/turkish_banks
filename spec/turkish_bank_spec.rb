require "spec_helper"

describe TurkishBanks::TurkishBank do
  before(:all) do
    @tb = TurkishBanks::TurkishBank.new
  end

  context "#new" do
    it "has last updated and banks attributes" do
      expect(@tb.banks).not_to be nil
      expect(@tb.last_update_date).not_to be nil
    end
  end
  
  context "#get_information_of" do
    it "has bank information" do
      bank = @tb.get_information_of "türkiye cumhuriyeti ziraat bankası a.ş."
      expect(bank).not_to be nil
    end
  end

  context "#get_branches_of" do
    it "has branches of the bank" do
      branches = @tb.get_branches_of "türkiye cumhuriyeti ziraat bankası a.ş."
      expect(branches).not_to be nil
    end
  end  
end
