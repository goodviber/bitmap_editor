class BaseCommand

    def initialize(args = [])
       @args = args
    end

    def is_number?(text)
       !!(/^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$/ =~ text)
    end

end