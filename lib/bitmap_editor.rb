# frozen_string_literal: true

require_relative 'bitmap'

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
