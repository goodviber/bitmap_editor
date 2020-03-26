# frozen_string_literal: true
require 'byebug'
require_relative 'bitmap'
require_relative 'create_new_image'
require_relative 'clear_the_table'
require_relative 'colour_the_pixel'
require_relative 'draw_vertical_segment'
require_relative 'draw_horizontal_segment'
require_relative 'show_content'

class BitmapEditor
  def initialize(file)
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
    begin
      run_all_commands
    rescue StandardError => e
      puts e.message
    end
  end

  def run_all_commands
    @commands.each do |command|
      letter, *args = command
      next if !all_commands.has_key?(letter)
      #byebug
      @bitmap = all_commands[letter].new(args).execute(@bitmap)
    end
  end

end
