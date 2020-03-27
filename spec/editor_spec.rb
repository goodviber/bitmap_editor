RSpec.describe Editor do
  let(:file) { File.read("spec/fixtures/sample.txt") }
  let(:missing_file) { File.read("spec/fixtures/missing_file.txt") }
  subject(:has_file) { Editor.new(file) }
  subject(:missing_file) { Editor.new(missing_file) }


  describe '.initialize' do
    it 'checks the existance of specified file' do
      expect { missing_file }.to raise_error
    end
  end

  describe '.start' do
    it 'reads specified file' do
    end
  end

  describe '.run_all_commands' do
    
  end

  it "reads sample file" do
    expect(File.read("spec/fixtures/sample.txt")).to eq("Hello")
  end
end