RSpec.describe DrawVerticalSegment do
  let(:bitmap) { BitMap.new(1,5) }
  let(:missing_bitmap) {}
  subject(:valid) { described_class.new(['1','1','5','A']) }
  subject(:invalid) { described_class.new(['1','5','A']) }
  subject(:not_number) { described_class.new(['1','5','s', 'A'])}
  subject(:reverse_range) { described_class.new(['1','5','1', 'A'])}
  subject(:outside_image) { described_class.new(['1','1','6', 'A'])}
  
  describe '.execute' do
    context 'with a bitmap image' do
      context 'with valid coordinates' do
        it 'changes the colour of the specified coordinates' do
          expect(valid.execute(bitmap).bitmap).to eq([['A'],['A'],['A'],['A'],['A']])
        end
      end

      context 'with invalid coordinates' do
        it 'raises an appropriate error' do
          expect { invalid.execute(bitmap) }.to raise_error(WrongNumberOfArgumentsError)
          expect { not_number.execute(bitmap) }.to raise_error(WrongTypeOfArgumentsError)
          expect { reverse_range.execute(bitmap) }.to raise_error(ReverseRangeError)
          expect { outside_image.execute(bitmap) }.to raise_error(InvalidCoordinatesError)
        end
      end
    end
  
    context 'with no bitmap image' do
      it 'raises an appropriate error' do
        expect { subject.execute(missing_bitmap) }.to raise_error(BitmapImageMissingError)
      end
    end
  end
end