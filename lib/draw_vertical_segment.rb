require_relative 'bitmap'
require_relative 'colour_the_pixel'

class DrawVerticalSegment
    def initialize(args = [])
        @args = args
    end
    
    def execute(bitmap)
        (@args[1]..@args[2]).each do |row|
            bitmap[row, @args[0]] = @args[3]
        end
        bitmap
    end
       
end