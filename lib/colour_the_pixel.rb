class ColourThePixel
    def initialize(args = [])
        @args = args
      end
    
      def execute(bitmap)
        bitmap[@args[1],@args[0]] = @args[2]
        bitmap
      end 
end