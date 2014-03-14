class Cell
    attr_accessor :row, :col
    def initialize row, col
        @row = row
        @col = col
    end
    def state
        [@col, @col]
    end
    
    def is_neigbour_to?(cell)
        self.is_next_to?(cell)
    end

    def is_next_to?(cell)
        row_diff = (self.row - cell.row).abs
        col_diff = (self.col - cell.col).abs
        col_diff <= 1 and row_diff <= 1 and not (col_diff == 0 and row_diff == 0)
    end

    def ==(other)
        self.class == other.class && self.state == other.state
    end
end
