$LOAD_PATH.push(__dir__)

require 'calculator'

print "\nEnter the principle amount (a whole positive number): "
principle = gets.to_f

print "\nEnter the interest rate (with up to 2 decimal places, eg: 2.22%): "
rate = gets.to_f

print "\nEnter the term in years (a whole positive number): "
term_years = gets.to_f

print "\nEnter the interest paid type (1 = at_maturity 2 = annually 3 = quarterly 4 = monthly): "
interest_paid_number = gets.chomp

interest_paid = ({
  '1' => :at_maturity,
  '2' => :annually,
  '3' => :quarterly,
  '4' => :monthly
})[interest_paid_number] || :unknown


calculator = Calculator.new(principle, rate, term_years, interest_paid)

puts calculator.calculate