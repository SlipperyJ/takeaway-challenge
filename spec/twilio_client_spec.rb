require 'twilio-ruby'

describe TwilioClient do
  subject(:client) { described_class.new(twilio)}

  let(:twilio) { spy(Twilio::REST::Client) }
  let(:message) { "Your order has been placed and will arrive with"}
  let(:recipient) { '+447965656565' }

  context "#send_message" do
    it "sends a message to me" do
      expect(twilio).to receive(:create).with(
        body: message,
        to: recipient,
        from: described_class::TWILIO_NUMBER
      )

      client.send_message(message, recipient)
    end
  end

end
