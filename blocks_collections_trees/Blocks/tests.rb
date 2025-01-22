require_relative 'processing_array'
require 'rspec/autorun'

describe ArrayProcessor do
  let(:array) { [1, 2, 3, 4, 5] }
  let(:processor) { described_class.new(array) }

  describe '#elements' do
    it 'returns the original array' do
      expect(processor.elements).to eq(array)
    end

    it 'does not allow modification of the original array' do
      expect { processor.elements << 6 }.to raise_error(FrozenError)
    end
  end

  describe '#custom_flat_map' do
    it 'maps and flattens the array based on the block' do
      result = processor.custom_flat_map { |x| [x, x * 2] }
      expect(result).to eq([1, 2, 2, 4, 3, 6, 4, 8, 5, 10])
    end
  end

  describe '#custom_one?' do
    it 'returns true if exactly one element matches the condition' do
      expect(processor.custom_one? { |x| x == 3 }).to be true
    end

    it 'returns false if no elements match the condition' do
      expect(processor.custom_one? { |x| x > 10 }).to be false
    end

    it 'returns false if more than one element matches the condition' do
      expect(processor.custom_one? { |x| x > 2 }).to be false
    end
  end

  describe '#custom_inject' do
    it 'accumulates values based on the block without an initial value' do
      result = processor.custom_inject { |sum, x| sum + x }
      expect(result).to eq(15)
    end

    it 'accumulates values based on the block with an initial value' do
      result = processor.custom_inject(10) { |sum, x| sum + x }
      expect(result).to eq(25)
    end
  end

  describe '#custom_min_by' do
    it 'returns the element with the minimum value based on the block' do
      result = processor.custom_min_by { |x| x * -1 }
      expect(result).to eq(5)
    end

    it 'returns nil for an empty array' do
      empty_processor = described_class.new([])
      expect(empty_processor.custom_min_by { |x| x }).to be_nil
    end
  end

  describe '#custom_find' do
    it 'returns the first element matching the condition' do
      result = processor.custom_find { |x| x > 3 }
      expect(result).to eq(4)
    end

    it 'returns nil if no element matches the condition' do
      result = processor.custom_find { |x| x > 10 }
      expect(result).to be_nil
    end
  end
end