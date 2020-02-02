# frozen_string_literal: true

RSpec.describe RobotGame do
  let(:game) { RobotGame.new }
  
  describe '#initialize' do
    it 'creates a instance of RobotGame' do
      expect(game).to be_kind_of RobotGame
    end
    it 'creates a table' do
      expect(game.instance_variable_get(:@table)).to be_kind_of Table
    end
    it 'creates a robot' do
      expect(game.instance_variable_get(:@robot)).to be_kind_of Robot
    end
  end

  describe '#start' do
    it 'have #start method' do
      expect(game).to respond_to(:start)
    end


  end
end
