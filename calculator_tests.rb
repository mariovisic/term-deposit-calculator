$LOAD_PATH.push(__dir__)

require 'minitest/autorun'
require 'calculator'

class TestCalculator < Minitest::Test
  def test_at_maturity
    result = Calculator.new(10_000, 1.10, 36, :at_maturity).calculate
    assert_equal(10_330, result)
  end

  def test_at_maturity_with_precise_rate
    result = Calculator.new(10_000, 2.22, 36, :at_maturity).calculate
    assert_equal(10_660, result)
  end

  def test_at_maturity_with_extra_months
    result = Calculator.new(10_000, 1.10, 38, :at_maturity).calculate
    assert_equal(10_348, result)
  end
end
