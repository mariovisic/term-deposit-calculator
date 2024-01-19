$LOAD_PATH.push(__dir__)

require 'minitest/autorun'
require 'calculator'

class TestCalculator < Minitest::Test
  def test_setup
    Calculator
    assert_equal(1, 1)
  end
end
