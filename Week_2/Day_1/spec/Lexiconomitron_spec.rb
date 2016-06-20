require 'rspec'
require '../Lexiconomitron'




describe Lexiconomitron do

  before(:each) do
  @lexi = Lexiconomitron.new
  end

  describe "#eat_t" do
    it "removes every letter t from the input" do
      expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end
  end

  describe "#shazam" do
    it "returns array of first and last words flipped" do
      expect(@lexi.shazam(['This', 'is', 'a', 'boring', 'test'])).to eq(['sih', 'se'])
    end
  end


  describe "#oompa_loompa" do
    it "returns array of words less than 3 words" do
      expect(@lexi.oompa_loompa(['if', 'you', 'wanna', 'be', 'my', 'lover'])).to eq(['if', 'you', 'be', 'my'])
    end

    it "returns array of words less than 3 words minus ts" do
      expect(@lexi.oompa_loompa(['if', 'you', 'wat', 'be', 'it', 'lot'])).to eq(['if', 'you', 'wa', 'be', 'i', 'lo'])
    end
  end


end
