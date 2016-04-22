class Number < ActiveModelSerializers::Model
  attr_reader :value

  alias :read_attribute_for_serialization :send

  def initialize(value)
    raise TypeError unless value.is_a?(Integer)

    @value = value
  end

  def fizz_buzz
    FizzBuzz.new.label_for(value)
  end
end
