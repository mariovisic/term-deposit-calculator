require 'bigdecimal'

class Calculator
  def initialize(principle, rate, months, interest_paid)
    @principle = BigDecimal(principle)
    @rate = BigDecimal(rate, 2)
    @months = months
    @interest_paid = interest_paid
  end

  def calculate
    balance = @principle * (1 + @rate / 100 * @months / BigDecimal(12))

    balance.truncate.to_i
  end
end