class NumbersController < ApplicationController
  def index
    numbers = NumbersService.new(page: page, per_page: per_page).paginate

    render json: numbers
  end

  def add_favourite
  end

  def remove_favourite
  end

  private

  def page
    (params[:page] || 1).to_i
  end

  def per_page
    (params[:per_page] || 100).to_i
  end
end
