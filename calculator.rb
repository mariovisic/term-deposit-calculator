require 'bigdecimal'

class Calculator
  def initialize(principle, rate, years, months, interest_paid)
    @principle = BigDecimal(principle)
    @rate = BigDecimal(rate, 2)
    @years = years
    @months = months
    @interest_paid = interest_paid
  end

  def calculate
    decimal = @principle * (1 + @rate / 100 * (@years + @months / BigDecimal(12)))

    decimal.truncate.to_i
  end
end