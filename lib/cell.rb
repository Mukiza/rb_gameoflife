class Cell
    attr_accessor :x, :y
    def initialize x, y
        @x = x
        @y = y
    end
    def state
        [@x, @y]
    end

    def ==(other)
        self.class == other.class && self.state == other.state
    end
end
