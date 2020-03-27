#require_relative 'bitmap'
class ColourThePixel < BaseCommand
    
  def execute(bitmap)
    assert_valid_arguments(bitmap)
    bitmap[row, column] = colour
    bitmap
  end 

  def column
    @args[0].to_i
  end

  def row
    @args[1].to_i
  end

  def colour
    @args[2]
  end

  def assert_valid_arguments(bitmap)
    super
    raise WrongNumberOfArgumentsError.new(self), "wrong number of arguments for #{self.class}, expected 3, got #{@args.size}" if @args.size != 3
    raise WrongTypeOfArgumentsError.new(self) if !@args[0..1].all? { |arg| is_number?(arg) }
    raise InvalidCoordinatesError.new(self) if column > bitmap.columns || row > bitmap.rows || column < 0 || row < 0
  end
end