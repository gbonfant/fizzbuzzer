require 'rails_helper'

describe NumbersService do
  describe '#new' do
    it 'allows an arbitrary page' do
      service = described_class.new(page: 10)

      expect(service.page).to eq(10)
    end

    it 'raises an error if the given page exceeds the maximum range' do
      expect { described_class.new(page: 4_000_000_001) }.to raise_error(NumbersService::MaxRangeExceededError)
    end
  end

  describe '#paginate' do
    it 'paginates an array of Number' do
      numbers = described_class.new(page: 2).paginate

      expect(numbers.first.value).to eq(25)
      expect(numbers.last.value).to eq(50)
    end
  end
end
