require 'rails_helper'

RSpec.describe 'routes for appointments', type: :routing do
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
    expect(get: '/v1/appointments/1').to route_to(
      controller: 'v1/appointments',
      action: 'show',
      id: '1'
    )
  end

  it 'routes /appointments/:id to the appointments controller' do
    expect(delete: '/v1/appointments/1').to route_to(
      controller: 'v1/appointments',
      action: 'destroy',
      id: '1'
    )
  end
end