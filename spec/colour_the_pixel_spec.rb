RSpec.describe ColourThePixel do
  let(:bitmap) { BitMap.new(5,1) }
  let(:missing_bitmap) {}
  subject(:valid) { described_class.new(['5','1','A']) }
  subject(:invalid) { described_class.new(['6','1','A']) }
  subject(:not_number) { described_class.new(['5','s', 'A'])}
  
  describe '.execute' do
    context 'with a bitmap image' do
      context 'with valid coordinates' do
        it 'changes the colour of the specified coordinate' do
          expect(valid.execute(bitmap).bitmap).to eq([[0,0,0,0,'A']])
        end
      end

      context 'with invalid coordinates' do
        it 'raises an appropriate error' do
          expect { invalid.execute(bitmap) }.to raise_error(InvalidCoordinatesError)
          expect { not_number.execute(bitmap) }.to raise_error(WrongTypeOfArgumentsError)
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