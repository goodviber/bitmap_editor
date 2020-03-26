#require_relative 'bitmap'

class DrawHorizontalSegment < BaseCommand
    
    def execute(bitmap)
      assert_valid_arguments(bitmap)
        (x1..x2).each do |column|
           ColourThePixel.new([column, y, colour]).execute(bitmap)
        end
        bitmap
    end
    
    def x1
      @args[0]
    end

    def x2
      @args[1]
    end

    def y
      @args[2]
    end

    def colour
      @args[3]
    end

    def assert_valid_arguments(bitmap)
      super
      raise WrongNumberOfArgumentsError.new(self), "wrong number of arguments for #{self.class}, expected 4, got #{@args.size}" if @args.size != 4
      raise WrongTypeOfArgumentsError.new(self) if !@args[0..2].all? { |arg| is_number?(arg) }
      raise InvalidCoordinatesError.new(self) unless x1.to_i.between?(0, bitmap.columns) || x2.to_i.between?(0, bitmap.columns) || y.to_i.between?(0, bitmap.rows)
      raise ReverseRangeError.new(self) if x1 > x2
    end
       
end