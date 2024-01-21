require 'bigdecimal'

class Calculator
  def initialize(principle, rate, months, interest_paid)
    @principle = BigDecimal(principle)
    @rate = BigDecimal(rate, 2)
    @months = months
    @interest_paid = interest_paid
  end

  def calculate
    if @interest_paid == :at_maturity
      balance = @principle * (1 + @rate / 100 * @months / BigDecimal(12))
    elsif @interest_paid == :annually
      balance = @principle
      interest_paid = BigDecimal(0)
      years_remaining = @months / BigDecimal(12)

      until years_remaining <= 0
        period_interest = balance * @rate / 100 * years_remaining.clamp(0, 1)
        interest_paid += period_interest
        balance += period_interest

        years_remaining -= 1
      end
    end

    balance.truncate.to_i
  end
end