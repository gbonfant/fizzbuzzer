require 'rails_helper'

describe Number do
  describe '#new' do
    it 'raises and exception if the initialized value type is not an integer' do
      expect { described_class.new('foo') }.to raise_error(TypeError)
    end
  end

  describe '#value' do
    it 'returns the initialized integer value' do
      number = described_class.new(10)

      expect(number.value).to eq(10)
    end
  end

  describe '#fizz_buzz' do
    it 'returns the corresponent string value for specific numeric values' do
      value = described_class.new(15).fizz_buzz

      expect(value).to eq('fizz_buzz')
    end
  end

  describe '#favourite?' do
    it 'returns true when the user has favourited the number' do
      UserFavourite.create(number_value: 5)

      expect(described_class.new(5).favourite?).to eq(true)
    end

    it 'returns false when the user has not favourited the number' do
      expect(described_class.new(5).favourite?).to eq(false)
    end
  end
end
