# frozen_string_literal: true
require_relative 'bitmap'

class CreateNewImage
  def initialize(args = [])
    @args = args
  end

  def execute(bitmap) #supplmentary for this method?
    @bitmap = BitMap.new(@args[0], @args[1])
  end
end
