$LOAD_PATH.push(__dir__)

require 'minitest/autorun'
require 'calculator'

class TestCalculator < Minitest::Test
  def test_at_maturity
    result = Calculator.new(10_000, 1.10, 3, :at_maturity).calculate
    assert_equal(10_330, result)
  end

  def test_at_maturity_with_precise_rate
    result = Calculator.new(10_000, 2.22, 3, :at_maturity).calculate
    assert_equal(10_666, result)
  end

  def test_annual_interest_paid
    result = Calculator.new(15_000, 1.10, 5, :annually).calculate
    assert_equal(15_843, result)
  end

  def test_monthly_interest_paid
    result = Calculator.new(15_000, 1.10, 5, :monthly).calculate
    assert_equal(15_848, result)
  end

  def test_quarterly_interest_paid
    result = Calculator.new(50_000, 6.15, 5, :quarterly).calculate
    assert_equal(67_842, result)
  end

  def test_invalid_interest_paid_type
    assert_raises Calculator::InvalidInterestPaidType do
      Calculator.new(50_000, 6.15, 5, :not_valid).calculate
    end
  end
end