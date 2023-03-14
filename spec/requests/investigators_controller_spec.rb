require 'rails_helper'

RSpec.describe V1::InvestigatorsController, type: :request do
  before(:each) do
    @user = User.create!(id: 2, name: 'John Doe', email: 'john@doe.com', password: 'Password1$$', admin: true)
    @investigator = Investigator.create!(id: 1, name: 'Investi Doe', photo: 'https://photos.com/photo1.jpg',
                                         description: 'Once a doe, always a doetective', fee: 45.99, rating: 4)
  end

  describe 'GET #index' do
    it 'returns http success' do
      get '/v1/investigators'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get "/v1/investigators/#{@investigator.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'returns http success' do
      sign_in @user
      post '/v1/investigators', params: { investigator: { name: 'Investi Doe', photo: 'https://photos.com/photo1.jpg', description: 'Once a doe, always a doetective', fee: 45.99, rating: 4 } }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE #destroy' do
    it 'returns http success' do
      sign_in @user
      delete '/v1/investigators/1'
      expect(response).to have_http_status(:success)
    end
  end
end
