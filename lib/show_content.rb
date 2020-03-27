#require_relative 'bitmap'

class ShowContent < BaseCommand
    
  def execute(bitmap)
    assert_valid_arguments(bitmap)
    if bitmap.is_a?(Array) # to handle double show command
      bitmap.each do |row|
        puts row.join
      end
    else
      bitmap.bitmap.each do |row|
        puts row.join
      end
    end
  end
       
end