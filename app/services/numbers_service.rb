class NumbersService
  attr_reader :page, :per_page

  def initialize(page: 1, per_page: 100)
    raise MaxRangeExceededError if page > max_range

    @page = page
    @per_page = per_page
  end

  def paginate
    (lower_range..upper_range).map do |int|
      Number.new(int)
    end
  end

  private

  def upper_range
    page * per_page
  end

  def lower_range
    (upper_range - per_page) + 1
  end

  def max_range
    100_000_000_000 / 25 # 4_000_000_000
  end

  class MaxRangeExceededError < Exception; end
end
