RSpec.describe Editor do
  let(:file) { "spec/fixtures/files/#{file_name}" }
  subject {Editor.new(file) }

  describe '.initialize' do
    context 'with non existent file' do
      let(:file_name) { 'missing_file.txt' }
      it 'raises an appropriate error' do
        expect { subject }.to raise_error(InvalidFileError)
      end
    end
    context 'with empty file' do
      let(:file_name) { 'empty.txt' }
      it 'raises an appropriate error' do
        expect { subject }.to raise_error(InvalidFileError)
      end
    end
  end

  describe '.start' do
    context 'with valid text file' do
      let(:file_name) { 'sample.txt' }
      it 'returns the specified text file lines as a BitMap' do
        expect(subject.start).to be_an_instance_of(BitMap)
      end
    end

    context 'with invalid text in the file' do
      let(:file_name) { 'jumbled.txt' }
      it 'raises appropriate errors' do
        expect{ subject.start }.to raise_error
      end
    end
  end

end