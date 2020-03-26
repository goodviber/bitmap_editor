# frozen_string_literal: true

RSpec.describe CreateNewImage do
  subject { described_class.new(%w[5 5]).execute(nil) }
  let(:bitmap) { BitMap.new(5, 5) }

  describe '.execute' do
    context 'with valid arguments' do
      it 'creates a bitmap image' do
        expect(subject.bitmap).to eq(bitmap.bitmap)
      end
    end

    context 'with invalid arguments' do
      it 'raises an appropriate error' do
        expect { described_class.new(['5']).execute(nil) }.to raise_error(WrongNumberOfArgumentsError)
        expect { described_class.new(%w[5 s]).execute(nil) }.to raise_error(WrongTypeOfArgumentsError)
        expect { described_class.new(%w[5 0]).execute(nil) }.to raise_error(DimensionsError)
      end
    end
  end
end
