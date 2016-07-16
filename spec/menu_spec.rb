require 'menu'
describe Menu do
  context "responds to" do
    it "dishes with a list of dishes" do
      expect(subject.dishes).to eq ({ vegan_steak: 10, carnivore_lettuce: 3, dinosaurus_burrito: 8, ostrich_tagine: 8})
    end
  end
end
