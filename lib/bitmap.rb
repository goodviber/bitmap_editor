# frozen_string_literal: true

class BitMap
  attr_reader :bitmap

  def initialize(columns, rows)
    @bitmap = Array.new(rows) { Array.new(columns, 0) }
    @columns = columns.to_i
    @rows = rows.to_i
  end

  def [](row, column)
    @bitmap[row - 1][column - 1]
  end
end
