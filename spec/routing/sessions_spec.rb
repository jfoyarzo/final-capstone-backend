require 'rails_helper'

RSpec.describe 'routes for Sessions', type: :routing do
  it 'routes /sessions to the user sessions controller new method' do
    expect(get: '/users/sign_in').to route_to(
      controller: 'users/sessions',
      action: 'new'
    )
  end

  it 'routes /sessions to the user sessions controller create method' do
    expect(post: '/users/sign_in').to route_to(
      controller: 'users/sessions',
      action: 'create'
    )
  end

  it 'routes /sessions to the user sessions controller destroy method' do
    expect(delete: '/users/sign_out').to route_to(
      controller: 'users/sessions',
      action: 'destroy'
    )
  end
end