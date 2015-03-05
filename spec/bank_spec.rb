require "spec_helper"

describe TurkishBanks::Bank do
  before(:all) do
    @tb = TurkishBanks::TurkishBank.new
  end

  context "#new" do
    it "creates a new bank object" do
      bank = @tb.get_information_of "türkiye cumhuriyeti ziraat bankası a.ş."
      expect(bank).not_to be nil
      expect(bank.name).not_to be nil
    end
  end  
end
