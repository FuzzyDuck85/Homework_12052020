require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../Bear.rb')
require_relative('../Fish.rb')
require_relative('../River.rb')

class BearTest < MiniTest::Test

  def setup()
    @bear1 = Bear.new("Yogi", "Grizzly")
    @fish1 = Fish.new("Arapaima")
    @fish2 = Fish.new("Pirahna")
    @fish3 = Fish.new("Tambaqui")
  end
  # => 1
  def test_can_create_bear()
    assert_equal(Bear, @bear1.class())
  end
  # => 2
  def test_does_bear_have_name()
    assert_equal("Yogi", @bear1.name)
  end
  # => 3
  def test_does_bear_have_type()
    assert_equal("Grizzly", @bear1.type)
  end
  # => 4
  def test_do_bears_roar()
    assert_equal("Roar!", @bear1.do_the_roar)
  end
  # => 5
  def test_bear_has_no_fish()
    assert_equal(0, @bear1.food_count)
  end
  # => 6
  def test_can_bear_take_fish()
    @bear1.take_a_fish(@fish1)
    assert_equal(1, @bear1.food_count())
  end
  # => 7
  def test_can_bear_take_multiple_fish()
    @bear1.take_a_fish(@fish1)
    @bear1.take_a_fish(@fish2)
    @bear1.take_a_fish(@fish3)
    assert_equal(3, @bear1.food_count())
  end

  # => 8
  def test_bear_take_fish_from_river()
    @river_name = River.new("Amazon")
    @river_name.add_to_river(@fish1)
    @bear1.take_fish_from_river(@river_name)
    assert_equal(1, @bear1.food_count())
    assert_equal(0, @river_name.fish_count())
  end
  # => 9
  def test_bear_take_multiple_fish_from_river()
    @river_name = River.new("Amazon")
    @river_name.add_to_river(@fish2)
    @river_name.add_to_river(@fish1)
    @river_name.add_to_river(@fish3)
    @bear1.take_fish_from_river(@river_name)
    assert_equal(3, @bear1.food_count())
    assert_equal(0, @river_name.fish_count())
  end

end
