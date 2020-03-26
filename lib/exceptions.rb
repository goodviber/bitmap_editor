class CustomError < StandardError
    attr_reader :data
    def initialize(data)
        super
        @data = data
    end
end

class BitmapImageMissingError < CustomError
    def message
        "Bitmap image is missing for #{data.class}"
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
    "x1 coordinate must be smaller or equal to x2 coordinate for #{data.class}"
  end
end