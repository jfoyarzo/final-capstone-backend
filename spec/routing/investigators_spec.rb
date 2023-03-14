require 'rails_helper'

RSpec.describe 'routes for Investigators', type: :routing do
  before(:each) do
    @investigator = Investigator.create!(id: 1, name: 'Investi Doe', photo: 'https://photos.com/photo1.jpg',
                                         description: 'Once a doe, always a doetective', fee: 45.99, rating: 4)
  end

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
    expect(get: "/v1/investigators/#{@investigator.id}").to route_to(
      controller: 'v1/investigators',
      action: 'show',
      id: @investigator.id.to_s
    )
  end

  it 'routes /investigators/:id to the investigators controller destroy method' do
    expect(delete: "/v1/investigators/#{@investigator.id}").to route_to(
      controller: 'v1/investigators',
      action: 'destroy',
      id: @investigator.id.to_s
    )
  end
end
