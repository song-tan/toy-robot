# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'

require 'ruby-enum'
require 'byebug'

require_relative 'command'
require_relative 'direction'
require_relative 'table'
require_relative 'robot'

class RobotGame
  def initialize
    @table = Table.new
    @robot = Robot.new
  end

  def start
    puts 'Please enter command:'
    loop do
      input = gets.chomp
      command = input.split(' ').first.upcase
      begin
        case command
          when Command.place
            begin
              @robot.place(input.split(' ').last)
            rescue Robot::RobotPlaceError, Robot::DirectionInputError => e
              puts e.message
            end
          when Command.move
            @robot.move(@table)
          when Command.left
            @robot.left
          when Command.right
            @robot.right
          when Command.report
            r = @robot.report
            puts r.to_s
          when Command.exit
            break
        else
          puts 'Command not exist!'
        end
      rescue Robot::RobotNotPlaceError => e
        puts e.message
      end
    end
  end
end