class Calculator
  def initialize(principle, rate, years, months, interest_paid)
    @principle = principle
    @rate = rate
    @years = years
    @months = months
    @interest_paid = interest_paid
  end

  def calculate
    @principle * (1 + @rate / 100 * @years)
  end
end