require 'rails_helper'

RSpec.describe V1::AppointmentsController, type: :request do
  before(:each) do
    @user = User.create!(id: 2, name: 'John Doe', email: 'john@doe.com', password: 'Password1$$', admin: true)
    @investigator = Investigator.create!(id: 1, name: 'Investi Doe', photo: 'https://photos.com/photo1.jpg',
                                         description: 'Once a doe, always a doetective', fee: 45.99, rating: 4)
    @appointment = Appointment.create!(id: 1, user_id: 2, investigator_id: 1,
                                       date: '2024-01-01 12:00', city: 'New York, NY')
    sign_in @user
  end

  describe 'GET #index' do
    it 'returns http success' do
      get '/v1/appointments'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get "/v1/appointments/#{@appointment.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'returns http success' do
      post '/v1/appointments',
           params: { appointment: { user_id: 2, investigator_id: 1, date: '2024-01-01 12:00', city: 'New York, NY' } }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE #destroy' do
    it 'returns http success' do
      delete '/v1/appointments/1'
      expect(response).to have_http_status(:success)
    end
  end
end
