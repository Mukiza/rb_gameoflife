class Board
    attr_accessor :cells

    def initialize cells, height = 3, width = 3
        @cells = cells
        @height = height
        @width = width
    end

    def live_cells
        @cells
    end

    def neighbours_to(cell)
        @cells.select do|a_cell|
            cell_row = (a_cell.row - cell.row).abs
            cell_col = (a_cell.col - cell.col).abs 
            cell_row <= 1 and  cell_col <= 1 and not cell_positions_eql?(cell_row, cell_col)        
        end.length
    end

    def cell_positions_eql?(cell_row, cell_col)
        cell_row == 0 and cell_col == 0
    end

    def is_alive?(cell)
        @cells.include?(cell)
    end

    def should_survive?(cell)
        [2, 3].include?(neighbours_to(cell)) and is_alive?(cell) 
    end

    def should_live?(cell)
        should_survive?(cell) or should_be_revived?(cell)
    end
    
    def should_be_revived?(cell)
        neighbours_to(cell) == 3 and  not is_alive?(cell)
    end

    def spawn
        survivors = []
        @width.times do|x|
            @height.times do|y|
                cell = Cell.new(y, x)
            survivors << cell if should_live?(cell) 
            end
        end
        Board.new(survivors)
    end
end
