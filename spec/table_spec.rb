# frozen_string_literal: true

RSpec.describe Table do
  let(:table) { described_class.new }

  describe '#initialize' do
    context 'by default' do
      it 'creates a instance of Table' do
        expect(table).to be_kind_of Table
      end

      it 'assigns default values' do
        expect(table.instance_variable_get(:@length)).to eq 5
        expect(table.instance_variable_get(:@width)).to eq 5
      end
    end
    context 'passing parameters' do
      let(:t) { described_class.new(4, 6) }
      it 'assigns values' do
        expect(t.instance_variable_get(:@length)).to eq 4
        expect(t.instance_variable_get(:@width)).to eq 6
      end
    end
  end

  describe '#falling?' do
    context 'when gets valid cords' do
      it 'return false if on table' do
        expect(table.falling?({x:4, y:4})).to be false
      end
      it 'return true if out of right table' do
        expect(table.falling?({x:5, y:4})).to be true
      end
      it 'return true if out of top table' do
        expect(table.falling?({x:4, y:5})).to be true
      end
      it 'return true if out of righttop table' do
        expect(table.falling?({x:5, y:5})).to be true
      end
      it 'return true if out of left table' do
        expect(table.falling?({x:-1, y:0})).to be true
      end
      it 'return true if out of bottom table' do
        expect(table.falling?({x:0, y:-1})).to be true
      end
      it 'return true if out of leftbottom table' do
        expect(table.falling?({x:-1, y:-1})).to be true
      end
    end
  end
end
