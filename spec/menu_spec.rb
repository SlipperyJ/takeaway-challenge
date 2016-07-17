require 'menu'
describe Menu do
  let(:menu_list) {{ vegan_steak: 10, carnivore_lettuce: 3, dinosaurus_burrito: 8, ostrich_tagine: 8}}

  context "#dishes" do
    it "returns a list of menu dishes" do
      expect(subject.dishes).to eq (menu_list)
    end
  end

  context "#order" do
    let(:order) {{ vegan_steak: 2}}
    let(:payment) { 20 }

    it "adds an order into the basket" do
      subject.order(order, payment)
      expect(subject.basket).to include(order)
    end

    context "when the payment doesn't match the total" do
      let(:payment) {19}
      it "raises an error" do
        expect {subject.order(order, payment)}.to raise_error "payment does not match total"
      end
    end
  end

  context "#basket" do
    let(:order) {{ vegan_steak: 2}}
    let(:payment) { 20 }

    it "returns order total" do
      subject.order(order, payment)
      expect(subject.total).to eq 20
    end
  end
end
