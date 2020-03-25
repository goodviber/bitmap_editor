# frozen_string_literal: true

class BitMap
  attr_reader :bitmap

  def initialize(columns, rows)
    @columns = columns.to_i
    @rows = rows.to_i
    @bitmap = Array.new(@rows) { Array.new(@columns, 0) }
  end

  def [](row, column)
    @bitmap[row - 1][column - 1]
  end
end
