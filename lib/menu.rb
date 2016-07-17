require 'dotenv'
require_relative './twilio_client'

class Menu

  attr_reader :dishes, :basket

  def initialize(client = TwilioClient, twilio_api_client = Twilio::REST::Client)
    Dotenv.load
    @dishes = { vegan_steak: 10,
                carnivore_lettuce: 3,
                dinosaurus_burrito: 8,
                ostrich_tagine: 8 }

    @client = client.new(twilio_api_client)
  end

  def order(items, payment, phone_number)
    @basket = items
    fail "payment does not match total" unless total == payment

    @client.send_message("Thanks for your order", phone_number)
  end

  def total
    @total = 0

    basket.each do |dish, amount|
      @total += @dishes[dish] * amount
    end
    @total
  end
end
