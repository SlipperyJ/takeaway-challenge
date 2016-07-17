require 'menu'
describe Menu do
  subject { described_class.new(twilio_client, twilio_api_client) }

  let(:twilio_client) { double(TwilioClient) }
  let(:twilio_api_client) { spy(Twilio::REST::Client) }

  let(:menu_list) {{ vegan_steak: 10, carnivore_lettuce: 3, dinosaurus_burrito: 8, ostrich_tagine: 8}}
  let(:recipient) { "+440000000000" }
  let(:confirmation_message) { "Thanks for your order" }

  before do
    allow(twilio_client).to receive(:new).with(twilio_api_client).and_return(twilio_client)
    allow(twilio_client).to receive(:send_message).with(confirmation_message, recipient)
  end

  context "#dishes" do
    it "returns a list of menu dishes" do
      expect(subject.dishes).to eq (menu_list)
    end
  end

  context "#order" do
    let(:order) {{ vegan_steak: 2}}
    let(:payment) { 20 }

    it "adds an order into the basket" do
      subject.order(order, payment, recipient)
      expect(subject.basket).to include(order)
    end

    context "when the payment doesn't match the total" do
      let(:payment) {19}
      it "raises an error" do
        expect do
          subject.order(order, payment, recipient)
        end.to raise_error("payment does not match total")
      end
    end

    context "when the payment matches the total" do
      it "sends a confirmation text message" do
        expect(twilio_client).to receive(:send_message).with(confirmation_message, recipient)
        subject.order(order, payment, recipient)
      end
    end
  end

  context "#basket" do
    let(:order) {{ vegan_steak: 2}}
    let(:payment) { 20 }

    it "returns order total" do
      subject.order(order, payment, recipient)
      expect(subject.total).to eq 20
    end
  end
end
