require "spec_helper"

describe TurkishBanks::Branch do
  before(:all) do
    @tb = TurkishBanks::TurkishBank.new
  end

  context "#new" do
    it "creates a new brach object" do
      braches = @tb.get_branches_of "türkiye cumhuriyeti ziraat bankası a.ş."
      expect(braches).not_to be nil
      expect(braches.first).not_to be nil
      expect(braches.first.name).not_to be nil
    end
  end  
end
