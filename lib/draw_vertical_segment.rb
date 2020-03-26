#require_relative 'bitmap'

class DrawVerticalSegment < BaseCommand
    
  def execute(bitmap)
    (y1..y2).each do |row|
      #bitmap[row, x] = colour
      ColourThePixel.new([x, row, colour]).execute(bitmap)
    end
    bitmap
  end

  def y1
    @args[1]
  end

  def y2
    @args[2]
  end

  def x
    @args[0]
  end

  def colour
    @args[3]
  end

  def assert_valid_arguments(bitmap)
    super
    raise WrongNumberOfArgumentsError.new(self), "wrong number of arguments for #{self.class}, expected 4, got #{@args.size}" if @args.size != 4
    raise WrongTypeOfArgumentsError.new(self) if !@args[0..2].all? { |arg| is_number?(arg) }
    raise InvalidCoordinatesError.new(self) unless y1.to_i.between?(0, bitmap.rows) || y2.to_i.between?(0, bitmap.rows) || x.to_i.between?(0, bitmap.columns)
    raise ReverseRangeError.new(self) if y1 > y2
  end
       
end