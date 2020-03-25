# frozen_string_literal: true

require_relative 'bitmap'

class BitmapEditor
  def initialize(file)
    @commands = []
    @file = file
  end

  def start
    File.readlines(@file).each do |line|
      # puts line to check file is being read correctly
      command, *args = line.chomp.split
      run_command(command, args)
    end
  end

  def run_command(command, args)
    case command
    when 'I'
      @bitmap = BitMap.new(*args)
      puts @bitmap.bitmap
    end
  end
end
