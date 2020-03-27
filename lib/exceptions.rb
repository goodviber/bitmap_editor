class CustomError < StandardError
    attr_reader :data
    def initialize(data)
        super
        @data = data
    end
end

class WrongNumberOfArgumentsError < CustomError
end

class WrongTypeOfArgumentsError < CustomError
    def message
        "A coordinate must be numeric for #{data.class}"
    end
end

class DimensionsError < CustomError
    def message
        "A row or column cannot be less than 1 for #{data.class}"
    end
end

class InvalidCoordinatesError < CustomError
  def message
    "A coordinate must be within the image for #{data.class}"
  end
end

class ReverseRangeError < CustomError
  def message
    "first coordinate must be smaller or equal to second coordinate for #{data.class}"
  end
end

class InvalidFileError < StandardError
  def initialize(msg="File is empty or missing")
    super
  end
end

class BitmapImageMissingError < StandardError
  def initialize(msg="Bitmap is missing")
    super
  end
end