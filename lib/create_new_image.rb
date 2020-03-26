# frozen_string_literal: true
require_relative 'bitmap'
require_relative 'exceptions'
require_relative 'base_command'

class CreateNewImage < BaseCommand 
  
  def execute(bitmap) #supplmentary for this method?
    assert_valid_arguments
    @bitmap = BitMap.new(@args[0], @args[1])
  end

  def assert_valid_arguments
    raise WrongNumberOfArguments.new(self), "wrong number of arguments for #{self.class}, expected 2, got #{@args.size}" if @args.size != 2
    raise WrongTypeOfArguments.new(self) if !@args.all? { |arg| is_number?(arg) }
    raise InvalidCoordinates.new(self) if @args.min.to_i < 1
  end

end
