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

    if @interest_paid == :at_maturity
      periods_remaining = 1
      rate = @rate * @years
    elsif @interest_paid == :annually
      periods_remaining = @years
      rate = @rate
    else
      periods_remaining = @years * 12
      rate = @rate / BigDecimal(12)
    end

    until periods_remaining <= 0
      period_interest = (balance * rate / 100 * periods_remaining.clamp(0, 1))
      balance += period_interest

      periods_remaining -= 1
    end

    balance.round(0)
  end
end