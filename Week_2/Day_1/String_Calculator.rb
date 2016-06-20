
class StringCalculator
  def initialize
  end

  def add(number)
    number_split = number.split(",")
    variable = number_split.reduce(0) do |sum, x|
      sum + x.to_i
    end

  end

end









#
# string_calc = StringCalculator.new
# string_calc.add("2,5,4")
