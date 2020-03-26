RSpec.describe ShowContent do
  let(:bitmap) { BitMap.new(5,1) }
  let(:missing_bitmap) {}
  subject { described_class.new(bitmap) }

  describe '.execute' do
    context 'with an image' do
      it 'outputs the image plus a return' do
        expect { subject.execute(bitmap) }.to output("00000\n").to_stdout
      end
    end

    context 'with no image' do
      it 'raises an appropriate error' do
        expect { subject.execute(missing_bitmap) }.to raise_error(BitmapImageMissingError)
      end
    end
  end
end