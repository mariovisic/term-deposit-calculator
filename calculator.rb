require 'bigdecimal'

class Calculator
  def initialize(principle, rate, years, interest_paid)
    @principle = BigDecimal(principle)
    @rate = BigDecimal(rate, 2)
    @years = years
    @interest_paid = interest_paid
  end

  def calculate
    balance = @principle

    case @interest_paid
    when :at_maturity
      periods = 1
      rate = @rate * @years
    when :annually
      periods = @years
      rate = @rate
    else
      periods = @years * 12
      rate = @rate / BigDecimal(12)
    end

    until periods <= 0
      period_interest = (balance * rate / 100 * periods.clamp(0, 1))
      balance += period_interest

      periods -= 1
    end

    balance.round(0)
  end
end