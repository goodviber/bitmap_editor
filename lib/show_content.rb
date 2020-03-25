require_relative 'bitmap'

class ShowContent
    def initialize(args = [])
        @args = args
    end
    
    def execute(bitmap)
        image = ""
        bitmap.bitmap.each do |row|
            image += row.join("") + "\n"
        end
        puts image
    end
       
end