# frozen_string_literal: true
require_relative 'bitmap'

class ClearTheTable
  def initialize(args = [])
    @args = args
  end

  def execute(bitmap)
    BitMap.new(@args[0], @args[1])
  end
end