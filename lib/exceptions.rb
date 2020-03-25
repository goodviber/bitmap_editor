class CommandNotFound < StandardError
    def initialize(msg="Command not found")
        super
    end
end