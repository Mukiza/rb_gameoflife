class Board
    attr_accessor :cells

    def initialize cells
        @cells = cells
    end

    def live_cells
        @cells
    end

    def neighbours_to(cell)
        @cells.select do|a_cell|
            cell_x_cordinate = (a_cell.x - cell.x).abs
            cell_y_cordinate = (a_cell.y - cell.y).abs 
            cell_x_cordinate <= 1 and  cell_y_cordinate <= 1 and not (cell_x_cordinate == 0 and cell_y_cordinate == 0)
        end.length
    end

    def spawn
        survivors = []
        @cells.each do |cell|
            survivors << cell if [2, 3].include?(neighbours_to(cell))
        end
        Board.new(survivors)
    end
end
