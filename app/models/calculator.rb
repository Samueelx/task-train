class Calculator
    attr_accessor :n1, :n2

    def initialize(n1:, n2:)
        @n1 = n1
        @n2 = n2
    end

    def add
        @n1 + @n2
    end

    def sub
        @n1 - @n2
    end

    def divide
        @n1 / @n2
    end

    def multiply
        @n1 * @n2
    end
end