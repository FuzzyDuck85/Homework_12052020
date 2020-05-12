class Bear

  attr_reader :name, :type

  def initialize(name, type)
    @name = name
    @type = type
    @stomach = []
  end

  def do_the_roar()
    return "Roar!"
  end

  def food_count()
    return @stomach.count()
  end

  def take_a_fish(fish)
    return @stomach.push(fish)
  end

  def take_fish_from_river(river_name)
    for fish in river_name.fish()
      take_a_fish(fish)
    end
    river_name.clear_river()
  end

end
