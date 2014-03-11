require './lib/cell'
require 'rspec'

describe "Cell" do
    let(:cell){Cell.new(1, 1)}
    it 'Creates a cell with x, y position cordinates' do
        expect(cell.state).to eql([1,1])
    end

    it "should be the same cell if cordinates are equal" do
        expect(cell).to eq(Cell.new(1, 1))
    end
end
