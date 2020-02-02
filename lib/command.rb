# frozen_string_literal: true

class Command
  include Ruby::Enum

  class CommandInputError < StandardError
    def message
      "Command is not valid!"
    end
  end

  define :move, "MOVE"
  define :left, "LEFT"
  define :right, "RIGHT"
  define :place, "PLACE"
  define :report, "REPORT"
  define :exit, "EXIT"
end
