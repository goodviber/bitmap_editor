class BaseCommand

  def initialize(args = [])
      @args = args
  end

  def is_number?(text)
      !!(/^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$/ =~ text)
  end
  
  def assert_valid_arguments(bitmap)
    raise BitmapImageMissingError, "bitmap is missing" if bitmap.nil?
  end
  
end