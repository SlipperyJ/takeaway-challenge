class Menu

  attr_reader :dishes

  def initialize
    @dishes = { vegan_steak: 10,
                carnivore_lettuce: 3,
                dinosaurus_burrito: 8,
                ostrich_tagine: 8 }
  end
end
