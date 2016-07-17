class Menu

  attr_reader :dishes, :basket

  def initialize
    @dishes = { vegan_steak: 10,
                carnivore_lettuce: 3,
                dinosaurus_burrito: 8,
                ostrich_tagine: 8 }
  end

  def order(items, payment)
    @basket = items
    fail "payment does not match total" unless total == payment
  end

  def total
    @total = 0

    basket.each do |dish, amount|
      @total += @dishes[dish] * amount
    end
    @total
  end
end
