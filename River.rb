class River
  attr_reader :river_name, :fish

  def initialize(river_name)
    @river_name = river_name
    @fish = []
  end

  def add_to_river(fish)
    @fish.push(fish)
  end

  def fish_count()
    return @fish.length()
  end

  def clear_river()
    @fish.clear()
  end
end
