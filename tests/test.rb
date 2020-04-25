class Animal
    attr_accessor( :name, :num_legs)
    def initialize(name, num_legs)
        @name = name
        @num_legs = num_legs
    end
end

class Dog < Animal
    def initialize
        super(name, 4)
    end
end

dog = Dog.new
p dog.num_legs
dog.name = "Bob"
p dog.name