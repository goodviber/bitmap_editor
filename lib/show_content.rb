#require_relative 'bitmap'

class ShowContent < BaseCommand
    
  def execute(bitmap)
    assert_valid_arguments(bitmap)
    bitmap.bitmap.each do |row|
      puts row.join
    end
  end
       
end