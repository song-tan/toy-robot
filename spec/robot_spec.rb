# frozen_string_literal: true

RSpec.describe Robot do
  let(:robot) { described_class.new }

  describe '#initialize' do
    context 'by default' do
      it 'creates a instance of Robot' do
        expect(robot).to be_kind_of Robot
      end

      it 'assigns default values' do
        expect(robot.instance_variable_get(:@position)).to be_nil
        expect(robot.instance_variable_get(:@direction)).to be_nil
      end
    end
  end

  describe '#place' do
    context 'when valid argument' do
      let(:arguments) { '3,2,EAST' }
      before {robot.place(*arguments)}
      it 'assign correctly to posistion' do
        expect(robot.instance_variable_get(:@position)).to be_kind_of Hash
        expect(robot.instance_variable_get(:@position)[:x]).to eq 3
        expect(robot.instance_variable_get(:@position)[:y]).to eq 2
      end

      it 'assign correctly to direction' do
        expect(robot.instance_variable_get(:@direction)).to eq 1
      end
    end

    context 'when invalid string' do
      it 'raise RobotPlaceError' do
        expect { robot.place('1,1') }.to raise_error(Robot::RobotPlaceError)
      end

      it 'raise DirectionInputError' do
        expect { robot.place(',,1') }.to raise_error(Robot::DirectionInputError)
      end
    end
  end

  describe "#right" do
    context 'when robot has not placed' do
      it 'raise a error' do
        expect { robot.right }.to raise_error Robot::RobotNotPlaceError
      end
    end
    context 'when robot has placed' do
      before { robot.place('0,0,NORTH') }
      it 'add 1 on direction' do
        robot.right
        expect(robot.instance_variable_get(:@direction)).to eq 1
      end
      it 'back to 0 on when current direction = 3' do
        robot.instance_variable_set(:@direction, 3)
        robot.right
        expect(robot.instance_variable_get(:@direction)).to eq 0
      end
    end
  end

  describe "#left" do
    context 'when robot has not placed' do
      it 'raise a error' do
        expect { robot.left }.to raise_error Robot::RobotNotPlaceError
      end
    end
    context 'when robot has placed' do
      before { robot.place('0,0,NORTH') }
      it 'will be 3 when current direction = 0' do
        robot.left
        expect(robot.instance_variable_get(:@direction)).to eq 3
      end
      it 'sub 1 on direction' do
        robot.instance_variable_set(:@direction, 3)
        robot.left
        expect(robot.instance_variable_get(:@direction)).to eq 2
      end
    end
  end

  describe '#move' do
    let(:table) { Table.new }

    context 'when robot has not placed' do
      it 'raise a error' do
        expect{ robot.move(table)}.to raise_error Robot::RobotNotPlaceError
      end
    end

    context 'when facing North' do
      it 'should move forward at bottom' do
        robot.place('0,0,NORTH')
        robot.move(table)
        expect(robot.instance_variable_get(:@direction)).to eq 0
        expect(robot.instance_variable_get(:@position)[:x]).to eq 0
        expect(robot.instance_variable_get(:@position)[:y]).to eq 1
      end
      it 'should not move forward at very top' do
        robot.place('0,4,NORTH')
        robot.move(table)
        expect(robot.instance_variable_get(:@direction)).to eq 0
        expect(robot.instance_variable_get(:@position)[:x]).to eq 0
        expect(robot.instance_variable_get(:@position)[:y]).to eq 4
      end
    end

    context 'when facing East' do
      it 'should move forward at very left' do
        robot.place('0,0,EAST')
        robot.move(table)
        expect(robot.instance_variable_get(:@direction)).to eq 1
        expect(robot.instance_variable_get(:@position)[:x]).to eq 1
        expect(robot.instance_variable_get(:@position)[:y]).to eq 0
      end
      it 'should not move forward at very right' do
        robot.place('4,0,EAST')
        robot.move(table)
        expect(robot.instance_variable_get(:@direction)).to eq 1
        expect(robot.instance_variable_get(:@position)[:x]).to eq 4
        expect(robot.instance_variable_get(:@position)[:y]).to eq 0
      end
    end

    context 'when facing South' do
      it 'should not move forward at bottom' do
        robot.place('0,0,SOUTH')
        robot.move(table)
        expect(robot.instance_variable_get(:@direction)).to eq 2
        expect(robot.instance_variable_get(:@position)[:x]).to eq 0
        expect(robot.instance_variable_get(:@position)[:y]).to eq 0
      end
      it 'should move forward at very top' do
        robot.place('0,4,SOUTH')
        robot.move(table)
        expect(robot.instance_variable_get(:@direction)).to eq 2
        expect(robot.instance_variable_get(:@position)[:x]).to eq 0
        expect(robot.instance_variable_get(:@position)[:y]).to eq 3
      end
    end

    context 'when facing West' do
      it 'should not move forward at left' do
        robot.place('0,0,WEST')
        robot.move(table)
        expect(robot.instance_variable_get(:@direction)).to eq 3
        expect(robot.instance_variable_get(:@position)[:x]).to eq 0
        expect(robot.instance_variable_get(:@position)[:y]).to eq 0
      end
      it 'should move forward at very right' do
        robot.place('4,0,WEST')
        robot.move(table)
        expect(robot.instance_variable_get(:@direction)).to eq 3
        expect(robot.instance_variable_get(:@position)[:x]).to eq 3
        expect(robot.instance_variable_get(:@position)[:y]).to eq 0
      end
    end
  end

  describe '#report' do
    context 'when robot has not placed' do
      it 'raise a error' do
        expect{ robot.report }.to raise_error Robot::RobotNotPlaceError
      end
    end
    context 'when robot has placed' do
      before { robot.place('0,0,NORTH') }
      it 'should return a Array' do
        expect(robot.report).to be_kind_of String
      end
      it 'should return a Array with size 3' do
        expect(robot.report.split(',').length).to eq 3
      end
    end
  end
end
