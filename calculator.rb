require 'bigdecimal'

class Calculator
  INTEREST_TYPES = %i(monthly quarterly annually at_maturity)
  InvalidInterestPaidType = Class.new(ArgumentError)

  def initialize(principle, rate, years, interest_paid)
    @principle = BigDecimal(principle)
    @rate = BigDecimal(rate, 4)
    @years = years
    @interest_paid = interest_paid
  end

  def calculate
    validate

    balance = @principle

    periods = case @interest_paid
    when :at_maturity then 1
    when :annually then @years
    when :quarterly then @years * 4
    when :monthly then @years * 12
    end

    rate = @rate / periods * @years

    periods.times do
      period_interest = (balance * rate / 100)
      balance += period_interest
    end

    balance.round(0)
  end

  private

  def validate
    if !INTEREST_TYPES.include?(@interest_paid)
      raise InvalidInterestPaidType.new("Interest paid type should be one of: #{INTEREST_TYPES}")
    end
  end
end