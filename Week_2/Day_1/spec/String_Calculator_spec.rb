require 'rspec'
require '../String_Calculator'



describe 'StringCalculator' do
  describe '#add' do
    it 'returns 0 for no numbers' do
      result = StringCalculator.new.add('')
      expect(result).to eq(0)
    end

    it 'returns 6 for 1,2,3' do
      result = StringCalculator.new.add("1,2,3")
      expect(result).to eq(6)
    end
  end
end
