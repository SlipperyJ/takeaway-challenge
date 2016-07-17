require 'menu'
describe Menu do
  let(:menu_list) {{ vegan_steak: 10, carnivre_lettuce: 3, dinosaurus_burrito: 8, ostrich_tagine: 8}}

  context "responds to" do
    it "dishes with a list of dishes" do
      expect(subject.dishes).to eq (menu_list)
    end
  end
end
