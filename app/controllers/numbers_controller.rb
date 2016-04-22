class NumbersController < ApplicationController
  def index
    numbers = NumbersService.new(page: page).paginate

    render json: numbers
  end

  private

  def page
    (params[:page] || 1).to_i
  end
end
