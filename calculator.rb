require 'bigdecimal'

class Calculator
  INTEREST_TYPES = %i(monthly quarterly annually at_maturity)
  InvalidInterestPaidType = Class.new(ArgumentError)
  InvalidPrinciple = Class.new(ArgumentError)
  InvalidInterestRate = Class.new(ArgumentError)
  InvalidTermYears = Class.new(ArgumentError)

  def initialize(principle, rate, term_years, interest_paid)
    @principle = BigDecimal(principle)
    @rate = BigDecimal(rate, 4)
    @term_years = term_years
    @interest_paid = interest_paid
  end

  def calculate
    validate

    balance = @principle
    @term_years = @term_years.to_i

    periods = case @interest_paid
    when :at_maturity then 1
    when :annually then @term_years
    when :quarterly then @term_years * 4
    when :monthly then @term_years * 12
    end

    rate = @rate / periods * @term_years

    periods.times do
      period_interest = (balance * rate / 100)
      balance += period_interest
    end

    balance.round(0)
  end

  private

  def validate
    if !INTEREST_TYPES.include?(@interest_paid)
      raise InvalidInterestPaidType, "Interest paid type must be one of: #{INTEREST_TYPES}"
    end

    if @principle <= 0
      raise InvalidPrinciple, "Principle must be positive and a whole number"
    end

    if @rate <= 0
      raise InvalidInterestRate, "Interest Rate must be positive"
    end

    if @term_years <= 0 || @term_years.to_i != @term_years
      raise InvalidTermYears, "Term years must be a whole number and positive"
    end
  end
end