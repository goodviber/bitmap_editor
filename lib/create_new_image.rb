# frozen_string_literal: true

class CreateNewImage
  def initialize(args = [])
    @args = args
  end

  def execute
    Bitmap.new(@args[0], @args[1])
  end
end
