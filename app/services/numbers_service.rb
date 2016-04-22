class NumbersService
  RESULTS_PER_PAGE = 25

  attr_reader :page

  def initialize(page: 1)
    raise MaxRangeExceededError if page > max_range

    @page = page
  end

  def paginate
    (lower_range..upper_range).map do |int|
      Number.new(int)
    end
  end

  private

  def upper_range
    page * RESULTS_PER_PAGE
  end

  def lower_range
    upper_range - RESULTS_PER_PAGE
  end

  def max_range
    100_000_000_000 / 25 # 4_000_000_000
  end

  class MaxRangeExceededError < Exception; end
end
