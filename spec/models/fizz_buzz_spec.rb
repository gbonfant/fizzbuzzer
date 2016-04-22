require 'rails_helper'

describe FizzBuzz do
  let(:fizz_buzz) { FizzBuzz.new }

  describe 'fizz?' do
    it 'returns true if the given number is divisible by 3' do
      expect(fizz_buzz.fizz?(6)).to eq(true)
    end

    it 'returns false if the given number is not divisible by 3' do
      expect(fizz_buzz.fizz?(4)).to eq(false)
    end
  end

  describe 'buzz?' do
    it 'returns true if the given number is divisible by 5' do
      expect(fizz_buzz.buzz?(10)).to eq(true)
    end

    it 'returns false if the given number is not divisible by 5' do
      expect(fizz_buzz.buzz?(4)).to eq(false)
    end
  end

  describe 'fizz_buzz?' do
    it 'returns true if the given number is divisible by 5' do
      expect(fizz_buzz.fizz_buzz?(15)).to eq(true)
    end

    it 'returns false if the given number is not divisible by 5' do
      expect(fizz_buzz.fizz_buzz?(8)).to eq(false)
    end
  end

  describe 'label_for' do
    it 'returns "fizz" when a number divisible by 3 is given' do
      expect(fizz_buzz.label_for(3)).to eq('fizz')
    end

    it 'returns "buzz" when a number divisible by 5 is given' do
      expect(fizz_buzz.label_for(5)).to eq('buzz')
    end

    it 'returns "fizz_buzz" when a number divisible by 3 and 5 is given' do
      expect(fizz_buzz.label_for(15)).to eq('fizz_buzz')
    end

    it 'returns nil when the given number is not divisible by 3 nor 5' do
      expect(fizz_buzz.label_for(8)).to eq(nil)
    end
  end
end
