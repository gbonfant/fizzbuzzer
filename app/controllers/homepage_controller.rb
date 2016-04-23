class HomepageController < ApplicationController
  def index
    @pagination = Kaminari.paginate_array([], total_count: total_count).
      page(page_number).
      per(per_page)
  end

  private

  def page_number
    (params[:page] || 1).to_i
  end

  def per_page
    (params[:per_page] || 100).to_i
  end

  def total_count
    NumbersService.new(page: page_number, per_page: per_page).max_range
  end
end
