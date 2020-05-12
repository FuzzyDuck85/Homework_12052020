require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../river.rb')
require_relative('../bear.rb')
require_relative('../fish.rb')

class RiverTest < MiniTest::Test

  def setup()
    @river = River.new("Amazon")
    @fish1 = Fish.new("Arapaima")
    @fish2 = Fish.new("Pirahna")
    @fish3 = Fish.new("Tambaqui")
  end
  # => 1
  def test_can_create_river()
    assert_equal(River, @river.class())
  end
  # => 2
  def test_does_river_have_name()
    assert_equal("Amazon", @river.river_name)
  end
  # => 3
  def test_river_is_empty()
    assert_equal(0, @river.fish_count())
  end
  # => 4
  def test_add_fish_to_river()
    @river.add_to_river(@fish1)
    assert_equal(1, @river.fish_count())
  end
  # => 5
  def test_add_multiple_fish_to_river()
    @river.add_to_river(@fish1)
    @river.add_to_river(@fish2)
    @river.add_to_river(@fish3)
    assert_equal(3, @river.fish_count())
  end

  def test_clear_river()
    @river.add_to_river(@fish1)
    @river.add_to_river(@fish2)
    @river.clear_river()
    assert_equal(0, @river.fish_count())
  end
end
