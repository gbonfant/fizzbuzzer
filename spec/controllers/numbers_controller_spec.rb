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
      expect(res['numbers'].first).to eq({ 'value' => 1, 'fizz_buzz' => nil })
    end

    it 'returns the given page number and the given number of results' do
      get :index, { page: 2, per_page: 4 }

      res = JSON.parse(response.body)

      # Second page with a page size of 4
      expect(res['numbers'].first).to eq({ 'value' => 5, 'fizz_buzz' => 'buzz' })
    end
  end

  describe 'POST /add_favourite'
  describe 'DELETE /remove_favourite'
end
