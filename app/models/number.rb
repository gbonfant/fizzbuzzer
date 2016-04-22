class Number
  attr_reader :value

  def initialize(value)
    raise TypeError unless value.is_a?(Integer)

    @value = value
  end

  def fizz_buzz
    FizzBuzz.new.label_for(value)
  end
end
