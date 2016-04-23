require 'rails_helper'

describe NumbersController do
  describe 'GET /index' do
    it 'returns a successful response' do
      get :index

      expect(response).to be_successful
    end

    it 'returns a paginated JSON response' do
      get :index

      res = JSON.parse(response.body)

      expect(res).to include('numbers')
      expect(res['numbers'].first).to eq({
        'value' => 1, 'fizz_buzz' => nil, 'favourite' => false
      })
    end

    it 'returns the given page number and the given number of results' do
      get :index, { page: 2, per_page: 4 }

      res = JSON.parse(response.body)

      # Second page with a page size of 4
      expect(res['numbers'].first).to eq({
        'value' => 5, 'fizz_buzz' => 'buzz', 'favourite' => false
      })
    end
  end

  describe 'POST /add_favourite' do
    it 'creates a new user favourite for the given number' do
      post :add_favourite, { number_value: 5 }

      res = JSON.parse(response.body)

      expect(res).to include('number_value' => 5)
      expect(UserFavourite.count).to eq(1)
    end

    it 'returns the record for the given number if it already exists' do
      UserFavourite.create(number_value: 5)

      post :add_favourite, { number_value: 5 }

      res = JSON.parse(response.body)

      expect(res).to include('number_value' => 5)
      expect(UserFavourite.count).to eq(1)
    end
  end

  describe 'DELETE /remove_favourite' do
    it 'deletes the user favourite record for the given number' do
      UserFavourite.create(number_value: 1)

      delete :remove_favourite, { number_value: 1 }

      res = JSON.parse(response.body)

      expect(res).to include('number_value' => 1)
      expect(UserFavourite.count).to eq(0)
    end

    it 'returns an error message if the record was not found' do
      delete :remove_favourite, { number_value: 1 }

      res = JSON.parse(response.body)

      expect(response.status).to eq(400)
      expect(res).to include('error' => 'record not found')
    end
  end
end
