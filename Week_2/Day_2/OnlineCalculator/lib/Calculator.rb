class Calculator

  def initialize

  end


  def self.calculate(num1, num2, operation)
    case operation
    when "add"
      self.add(num1, num2)
    when "subtract"
      self.subtract(num1, num2)
    when "multiply"
      self.multiply(num1, num2)
    when "divide"
      self.divide(num1, num2)
    end
  end

  def self.add(num1, num2)
    num1 + num2
  end

  def self.subtract(num1, num2)
    num1 - num2
  end

  def self.multiply(num1, num2)
    num1 * num2
  end


  def self.divide(num1, num2)
    num1 / num2
  end

  def self.load
    lines = []
    File.readlines(@filename).each do |line|
      lines << line
    end

    return lines[0]
  end

  def self.save(result)
    @filename = "persitance.txt"
    @result = result.to_s
    open(@filename, 'w') do |f|
      f << @result + "\n"
    end
  end


end

calc = Calculator.save("25")
