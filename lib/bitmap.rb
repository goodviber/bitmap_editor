# frozen_string_literal: true

class BitMap
  attr_reader :bitmap, :rows, :columns

  def initialize(columns, rows)
    @columns = columns.to_i
    @rows = rows.to_i
    @bitmap = Array.new(@rows) { Array.new(@columns, 0) }
  end

  def []=(row, column, colour)
    @bitmap[row.to_i-1][column.to_i-1] = colour
  end
  
end
