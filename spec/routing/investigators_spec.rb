require 'rails_helper'

RSpec.describe 'routes for Investigators', type: :routing do
  it 'routes /investigators to the investigators controller index method' do
    expect(get: '/v1/investigators').to route_to(
      controller: 'v1/investigators',
      action: 'index'
    )
  end

  it 'routes /investigators to the investigators controller create method' do
    expect(post: '/v1/investigators').to route_to(
      controller: 'v1/investigators',
      action: 'create'
    )
  end

  it 'routes /investigators/:id to the investigators controller show method' do
    expect(get: '/v1/investigators/1').to route_to(
      controller: 'v1/investigators',
      action: 'show',
      id: '1'
    )
  end

  it 'routes /investigators/:id to the investigators controller destroy method' do
    expect(delete: '/v1/investigators/1').to route_to(
      controller: 'v1/investigators',
      action: 'destroy',
      id: '1'
    )
  end
end