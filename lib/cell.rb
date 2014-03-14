class Cell
    attr_accessor :row, :col
    def initialize row, col
        @row = row
        @col = col
    end
    def state
        [@col, @col]
    end

    def ==(other)
        self.class == other.class && self.state == other.state
    end
end
