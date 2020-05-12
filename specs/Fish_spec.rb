require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../Fish.rb')

class FishTest < MiniTest::Test

  def setup()
    @fish1 = Fish.new("Pirahna")
  end

  def test_can_create_fish()
    assert_equal(Fish, @fish1.class())
  end

  def test_fish_name()
    assert_equal("Pirahna", @fish1.name)
  end

end
