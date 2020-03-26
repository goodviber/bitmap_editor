# frozen_string_literal: true

class ClearTheTable < BaseCommand
  def execute(bitmap)
    assert_valid_arguments(bitmap) # what do we need for this, an image?
    bitmap = BitMap.new(columns(bitmap), rows(bitmap))
  end

  def assert_valid_arguments(bitmap)
    raise BitmapImageMissingError, "bitmap is missing" if bitmap.nil?
  end

  def columns(bitmap)
    bitmap[0].size
  end

  def rows(bitmap)
    bitmap.size
  end
end
