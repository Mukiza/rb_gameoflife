require './lib/board'
require './lib/cell'
require 'rspec'

describe "Empty Board" do
    let(:cell){Cell.new(1, 1)}
    it "should be empty if created empty" do
        expect(Board.new([]).live_cells).to be_empty
    end

    it "should have the cells that its created with" do
        cell2 = Cell.new(2, 2)
        expect(Board.new([cell, cell2]).live_cells).to eql([cell, cell2])
    end

    it "should spawn an empty board if empty" do
        board = Board.new([])
        expect(board.spawn.live_cells).to be_empty
    end

    it "should kill a lonely cell" do
        board = Board.new([cell])
        expect(board.spawn.live_cells).to be_empty
    end
    it "should keep a cell with two neighbours" do
        board = Board.new([cell, Cell.new(2,0), Cell.new(2,2)])
        expect(board.spawn.live_cells).to include(cell)
    end

    describe "Board counting neigbours" do
        it "should find zero neigbours to a lonel cell" do
            board = Board.new([cell])
            expect(board.neighbours_to(cell)).to eql(0) 
        end
        
        it "should find neigbours to a single cell" do
            cell = Cell.new(1, 1)
            board = Board.new([cell])
            expect(board.neighbours_to(Cell.new(0,0))).to eql(1) 
            expect(board.neighbours_to(Cell.new(0,1))).to eql(1) 
            expect(board.neighbours_to(Cell.new(0,2))).to eql(1) 
            expect(board.neighbours_to(Cell.new(1,0))).to eql(1) 
            expect(board.neighbours_to(Cell.new(1,2))).to eql(1) 
            expect(board.neighbours_to(Cell.new(2,0))).to eql(1) 
            expect(board.neighbours_to(Cell.new(2,1))).to eql(1) 
            expect(board.neighbours_to(Cell.new(2,2))).to eql(1) 
        end

        it "should handle cells with two neihgbours" do
            board = Board.new([Cell.new(2, 2), Cell.new(0,0)])
            expect(board.neighbours_to(cell)).to eq(2)
        end

        it "should keep cells with three neighbours" do
            board = Board.new([Cell.new(0, 1), cell, Cell.new(2,0), Cell.new(2,2)])
            expect(board.spawn.live_cells).to include(cell)
        end

        it 'should revive a cell threee neighbours' do
            next_generation = next_generation_for([[0, 0], [2, 0], [1, 1]])
            expect(next_generation).to include(Cell.new(1, 0))
        end

        it 'should handle start fromation'do
            next_generation = next_generation_for([[0,0], [2,0], [1,1], [0, 2], [2,2]])
            expect(next_generation).to eq([Cell.new(1, 0), Cell.new(0, 1), Cell.new(2, 1), Cell.new(1, 2)])
        end

        def next_generation_for(seed)
            cells = []
            seed.each do |x, y|
                cells << Cell.new(x, y)
            end
            board = Board.new(cells)
            board.spawn.live_cells
        end
    end
end
