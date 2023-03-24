require 'rails_helper'

RSpec.describe 'routes for appointments', type: :routing do
  before(:each) do
    @user = User.create!(id: 2, name: 'John Doe', email: 'john@doe.com', password: 'Password1$$', admin: true)
    @investigator = Investigator.create!(id: 1, name: 'Investi Doe', photo: 'https://photos.com/photo1.jpg',
                                         description: 'Once a doe, always a doetective', fee: 45.99, rating: 4)
    @appointment = Appointment.create!(id: 1, user_id: 2, investigator_id: 1,
                                       date: '2024-01-01 12:00', city: 'New York, NY')
  end

  it 'routes /appointments to the appointments controller' do
    expect(get: '/v1/appointments').to route_to(
      controller: 'v1/appointments',
      action: 'index'
    )
  end

  it 'routes /appointments to the appointments controller' do
    expect(post: '/v1/appointments').to route_to(
      controller: 'v1/appointments',
      action: 'create'
    )
  end

  it 'routes /appointments/:id to the appointments controller' do
    expect(get: "/v1/appointments/#{@appointment.id}").to route_to(
      controller: 'v1/appointments',
      action: 'show',
      id: @appointment.id.to_s
    )
  end

  it 'routes /appointments/:id to the appointments controller' do
    expect(delete: "/v1/appointments/#{@appointment.id}").to route_to(
      controller: 'v1/appointments',
      action: 'destroy',
      id: @appointment.id.to_s
    )
  end
end
