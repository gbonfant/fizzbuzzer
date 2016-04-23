class NumbersController < ApplicationController
  def index
    numbers = NumbersService.new(page: page, per_page: per_page).paginate

    render json: numbers
  end

  def add_favourite
    render json: UserFavourite.find_or_create_by(number_value: number_value)
  end

  def remove_favourite
    user_favourite = UserFavourite.find_by(number_value: number_value)

    if user_favourite
      render json: user_favourite.destroy
    else
      render json: { error: 'record not found' }, status: 400
    end
  end

  private

  def page
    (params[:page] || 1).to_i
  end

  def per_page
    (params[:per_page] || 100).to_i
  end

  def number_value
    params[:number_value]
  end
end
