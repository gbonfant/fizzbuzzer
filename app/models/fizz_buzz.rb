class FizzBuzz
  def fizz?(number)
    number % 3 == 0
  end

  def buzz?(number)
    number % 5 == 0
  end

  def fizz_buzz?(number)
    fizz?(number) && buzz?(number)
  end

  def label_for(number)
    if fizz_buzz?(number)
      'fizz_buzz'
    elsif buzz?(number)
      'buzz'
    elsif fizz?(number)
      'fizz'
    else
      nil
    end
  end
end
