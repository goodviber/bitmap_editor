# frozen_string_literal: true

# require "bitmap_editor/version"

class BitmapEditor
  def initialize(file)
    @commands = []
    @file = file
  end

  def start
    File.readlines(@file).each do |line|
      puts line
    end
  end
end
