require 'bigdecimal'

class Calculator
  def initialize(principle, rate, years, interest_paid)
    @principle = BigDecimal(principle)
    @rate = BigDecimal(rate, 4)
    @years = years
    @interest_paid = interest_paid
  end

  def calculate
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
end