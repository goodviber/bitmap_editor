class CustomError < StandardError
    attr_reader :data
    def initialize(data)
        super
        #@data = data
    end
end

class WrongNumberOfArguments < CustomError
end

class WrongTypeOfArgument < CustomError
    def message
        "A coordinate must be numeric for #{data.class}"
    end
end

class InvalidCoordinates < CustomError
    def message
        "A coordinate cannot be less than zero for #{data.class}"
    end
end