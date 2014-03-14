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


    it "should know that a given cell is the next position" do
        expect(cell.is_in_next_position?(Cell.new(0, 1))).to be_true
        expect(cell.is_in_next_position?(Cell.new(3, 2))).to be_false
    end

    it "should know a cell who is neighbour" do
        expect(cell.is_neigbour_to?(Cell.new(1, 2))).to be_true
    end
end
