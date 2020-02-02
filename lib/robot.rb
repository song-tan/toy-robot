# frozen_string_literal: true

class Robot
  class RobotNotPlaceError < StandardError
    def message
      'Please place Robot first'
    end
  end

  class RobotPlaceError < StandardError
    def message
      'Cannot place to this position, format - "0,0,NORTH"'
    end
  end

  class DirectionInputError < StandardError
    def message
      'Direction is invalid, like - "NORTH", "EAST", "SOUTH", "WEST'
    end
  end

  def initialize
    @position = nil
    @direction = nil
  end

  def place(str)
    array = str.split(',')
    raise Robot::RobotPlaceError if array.length != 3
    raise Robot::RobotPlaceError if array[0].to_i.nil? || array[1].nil?
    raise Robot::DirectionInputError unless Direction.keys.include?(array[2].upcase.to_sym)

    @direction = Direction.value(array[2].strip.to_sym)
    @position = { x: array[0].strip.to_i, y: array[1].strip.to_i }
  end

  def right
    raise RobotNotPlaceError if @direction.nil?
    @direction = (@direction + 1) % 4
  end

  def left
    raise RobotNotPlaceError if @direction.nil?
    @direction = (@direction + 3).abs % 4
  end

  def move(table)
    raise RobotNotPlaceError if @position.nil?
    new_p = next_position(@position)
    @position = new_p unless table.falling?(new_p)
  end

  def report
    raise RobotNotPlaceError if @position.nil? || @direction.nil?
    [@position[:x], @position[:y], Direction.key(@direction).to_s].join(',')
  end

  private

  def next_position(x:, y:)
    if (@direction % 2).zero?
      y += (1 - @direction)
    else
      x += (2 - @direction)
    end
    { x: x, y: y }
  end
end
