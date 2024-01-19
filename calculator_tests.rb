$LOAD_PATH.push(__dir__)

require 'minitest/autorun'
require 'calculator'

class TestCalculator < Minitest::Test
  def test_setup
    result = Calculator.new(10_000, 1.10, 3, 0, :at_maturity).calculate
    assert_equal(result, 10_330)
  end
end
