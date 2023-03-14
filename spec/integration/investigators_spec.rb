require 'swagger_helper'

describe 'Investigators API' do
  path '/v1/investigators' do
    post 'Creates an investigator' do
      tags 'Investigators'
      consumes 'application/json'
      parameter name: :investigator, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          photo: { type: :string },
          description: { type: :string },
          fee: { type: :number },
          rating: { type: :number }
        },
        required: %w[name photo description fee rating]
      }

      response '201', 'investigator created' do
        let(:investigator) { { name: 'Investi Dodo', photo: 'http://www.example.com', description: 'Test description', fee: 25.99, rating: 4 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:investigator) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/v1/investigators/{id}' do
    get 'Retrieves an investigator' do
      tags 'Investigators'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'id found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 photo: { type: :string },
                 description: { type: :string },
                 fee: { type: :float },
                 rating: { type: :number }
               },
               required: %w[name photo description fee rating]

        let(:id) { Investigator.create(name: 'Investi Foo', photo: 'http://example.com/avatar.jpg', description: 'Another test description', fee: 50.99, rating: 5).id }
        run_test!
      end

      response '404', 'investigator not found' do
        let(:id) { 10 }
        run_test!
      end
    end
  end
end
