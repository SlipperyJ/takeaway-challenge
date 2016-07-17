require 'twilio-ruby'

class TwilioClient

  attr_reader :client

  ACCOUNT_SID =   ENV['ACCOUNT_SID']
  AUTH_TOKEN =    ENV['AUTH_TOKEN']
  TWILIO_NUMBER = ENV['TWILIO_NUMBER']

  def initialize(client = Twilio::REST::Client)
    @client = client.new(ACCOUNT_SID, AUTH_TOKEN)
  end

  def send_message(message, recipient)
    @client.messages.create(
      from: TWILIO_NUMBER,
      to:   recipient,
      body: message)
  end
end
