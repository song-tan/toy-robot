# frozen_string_literal: true

# Table class
class Table
  def initialize(length = 5, width = 5)
    @length = length
    @width = width
  end

  def falling?(x:, y:)
    x.negative? || x >= @length || y.negative? || y >= @width
  end
end
