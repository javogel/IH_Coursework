require 'rspec'
require_relative '../FizzBuzz'



describe 'FizzBuzz' do
  describe '#convert' do
    it 'returns Fizz for divisible by 3' do
      result = FizzBuzz.new.convert(3)
      expect(result).to eq("Fizz")
    end

    it 'returns Buzz for divisible by 5' do
      result = FizzBuzz.new.convert(5)
      expect(result).to eq("Buzz")
    end

    it 'returns FizzBuzz for divisible by 3 and 5' do
      result = FizzBuzz.new.convert(15)
      expect(result).to eq("FizzBuzz")
    end

    it 'returns number for 1' do
      result = FizzBuzz.new.convert(1)
      expect(result).to eq(1)
    end
end
end
