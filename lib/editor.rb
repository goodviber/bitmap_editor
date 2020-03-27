# frozen_string_literal: true

require_relative 'create_new_image'
require_relative 'clear_the_table'
require_relative 'colour_the_pixel'
require_relative 'draw_vertical_segment'
require_relative 'draw_horizontal_segment'
require_relative 'show_content'

class Editor
  
  def initialize(file)
    raise InvalidFileError if !File.exists?(file) || File.zero?(file)
    @bitmap = nil
    @commands = []
    @file = file
  end

  def all_commands
    { 
      'I' => CreateNewImage,
      'C' => ClearTheTable,
      'L' => ColourThePixel,
      'V' => DrawVerticalSegment,
      'H' => DrawHorizontalSegment,
      'S' => ShowContent
    }
  end

  def start
    File.readlines(@file).each do |line|
      @commands << line.chomp.split
    end
    #run_all_commands
    @commands.each do |command|
      letter, *args = command
      letter = letter.upcase
      if !all_commands.has_key?(letter)
        puts "Command #{letter} not recognized"
        next # or return to exit
      end
      @bitmap = all_commands[letter].new(args).execute(@bitmap)
    end
    @bitmap
  end

end
