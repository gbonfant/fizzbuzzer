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
  end
end
