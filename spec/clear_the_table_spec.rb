# frozen_string_literal: true

RSpec.describe ClearTheTable do
  let(:bitmap) { Array.new(5) { Array.new(5, 1) } }
  let(:cleared_bitmap) { Array.new(5) { Array.new(5, 0) } }
  let(:missing_bitmap) {}
  subject { described_class.new(['5','5']) }
  
  describe '.execute' do
    context 'with a bitmap image' do
      it 'sets the bitmap image to all zeros' do
        expect(subject.execute(bitmap).bitmap).to eq(cleared_bitmap)
      end
    end

    context 'with no bitmap image' do
      it 'raises an appropriate error' do
        expect { subject.execute(missing_bitmap) }.to raise_error(BitmapImageMissingError)
      end
    end
  end

end
