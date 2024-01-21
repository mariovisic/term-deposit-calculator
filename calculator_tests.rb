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

  def test_annual_interest_paid_whole_year_timeline
    result = Calculator.new(15_000, 1.10, 60, :annually).calculate
    assert_equal(15_843, result)
  end

  def test_annual_interest_paid_with_extra_months
    result = Calculator.new(15_000, 1.10, 58, :annually).calculate
    assert_equal(15_814, result)
  end
end