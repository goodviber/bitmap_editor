require_relative 'bitmap'
require_relative 'colour_the_pixel'

class DrawHorizontalSegment
    def initialize(args = [])
        @args = args
    end
    
    def execute(bitmap)
        (@args[0]..@args[1]).each do |column|
            bitmap[@args[2], column] = @args[3]
        end
        bitmap
    end
       
end