# frozen_string_literal: true

RSpec.describe BitMap do
  subject { BitMap.new(5, 5) }

  describe 'on setup' do
    it 'has a bitmap of the correct size' do
      expect(subject.bitmap.length).to eq(5)
      expect(subject.bitmap[0].length).to eq(5)
    end

    it 'has a bitmap of the default color' do
      expect(subject.bitmap[0][0]).to eq(0)
      expect(subject.bitmap.uniq.size).to eq(1)
    end
  end
end
