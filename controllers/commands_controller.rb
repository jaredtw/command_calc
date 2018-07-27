require_relative '../entry/command'

class CommandsController
  attr_reader :command

  def initialize
    @command = Command.new
  end

  
end
