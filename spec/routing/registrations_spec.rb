require 'rails_helper'

RSpec.describe 'routes for Registrations', type: :routing do
  it 'routes /registrations to the user registrations controller new method' do
    expect(get: '/users/sign_up').to route_to(
      controller: 'users/registrations',
      action: 'new'
    )
  end

  it 'routes /registrations to the user registrations controller create method' do
    expect(post: '/users').to route_to(
      controller: 'users/registrations',
      action: 'create'
    )
  end

  it 'routes /registrations to the user registrations controller update method' do
    expect(patch: '/users').to route_to(
      controller: 'users/registrations',
      action: 'update'
    )
  end

  it 'routes /registrations to the user registrations controller destroy method' do
    expect(delete: '/users').to route_to(
      controller: 'users/registrations',
      action: 'destroy'
    )
  end
end