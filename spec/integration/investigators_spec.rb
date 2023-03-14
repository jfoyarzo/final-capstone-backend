require 'swagger_helper'

describe 'Investigators API' do
  path '/v1/investigators' do
    post 'Creates a private investigator' do
      tags 'Private Investigators'
      consumes 'application/json'
      parameter name: :investigator, in: :body, schema: { type: :object,
                                                          properties: {
                                                            investigator: { type: :object,
                                                                            properties: {
                                                                              name: { type: :string },
                                                                              photo: { type: :string },
                                                                              description: { type: :string },
                                                                              fee: { type: :number },
                                                                              rating: { type: :number }
                                                                            } }
                                                          },
                                                          required: %w[name photo description fee rating] }
      request_body_example value: { investigator: {
        name: 'Investi Gator',
        photo: 'http://example.com/avatar.jpg',
        description: 'Highly resilient private investigator, has big mouth and teeth',
        fee: 69.95,
        rating: 5
      } },
                           name: 'request_create_pi',
                           summary: 'A request example for creating a private investigator'

      response '201', 'investigator created' do
        example 'application/json', :example_response_create_pi, {
          status: {
            code: 201,
            message: 'Investigator created successfully.'
          },
          data: {
            id: 1,
            name: 'Investi Gator',
            photo: 'http://example.com/avatar.jpg',
            description: 'Highly resilient private investigator, has big mouth and teeth',
            fee: 69.95,
            rating: 5
          }
        }
        let(:investigator) { { name: 'Investi Dodo', photo: 'http://www.example.com', description: 'Test description', fee: 25.99, rating: 4 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:investigator) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/v1/investigators' do
    get 'Retrieves all private investigators' do
      tags 'Private Investigators'
      produces 'application/json'

      response '200', 'investigators found' do
        example 'application/json', :example_response, [
          {
            id: 1,
            name: 'Investi Gator',
            photo: 'http://example.com/avatar.jpg',
            description: 'Highly resilient private investigator, has big mouth and teeth',
            fee: 69.95,
            rating: 5
          },
          {
            id: 2,
            name: 'Investi Goat',
            photo: 'http://example.com/avatar2.jpg',
            description: 'Very agile private investigator, lovely voice',
            fee: 99.95,
            rating: 4
          }
        ]
        schema type: :array,
               items: { type: :object,
                        properties: {
                          id: { type: :integer },
                          name: { type: :string },
                          photo: { type: :string },
                          description: { type: :string },
                          fee: { type: :string },
                          rating: { type: :number }
                        } }
        run_test!
      end
    end
  end

  path '/v1/investigators/{id}' do
    get 'Retrieves a private investigator' do
      tags 'Private Investigators'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'id found' do
        example 'application/json', :example_response, {
          id: 1,
          name: 'Investi Gator',
          photo: 'http://example.com/avatar.jpg',
          description: 'Highly resilient private investigator, has big mouth and teeth',
          fee: 69.95,
          rating: 5
        }
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 photo: { type: :string },
                 description: { type: :string },
                 fee: { type: :string },
                 rating: { type: :number }
               },
               required: %w[name photo description fee rating]

        let(:id) { Investigator.create(name: 'Investi Foo', photo: 'http://example.com/avatar.jpg', description: 'Another test description', fee: 50.99, rating: 5).id }
        run_test!
      end

      response '404', 'investigator not found' do
        let(:id) { 0 }
        run_test!
      end
    end
  end

  path '/v1/investigators/{id}' do
    delete 'Deletes a private investigator' do
      tags 'Private Investigators'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'investigator deleted' do
        example 'application/json', :response_on_delete, {
          status: {
            code: 200,
            message: 'Investigator deleted successfully.'
          },
          data: {
            name: 'Investi Cat',
            photo: 'http://www.example2.com',
            description: 'Sample description 2',
            fee: '5.89',
            rating: 4
          }
        }
        schema type: :object,
               properties: {
                 status: { type: :object,
                           properties: {
                             code: { type: :integer },
                             message: { type: :string }
                           } },
                 data: { type: :object,
                         properties: {
                           name: { type: :string },
                           photo: { type: :string },
                           description: { type: :string },
                           fee: { type: :number },
                           rating: { type: :integer }
                         } }
               }

        let(:id) { Investigator.create(name: 'Investi Foo', photo: 'http://example.com/avatar.jpg', description: 'Another test description', fee: 50.99, rating: 5).id }
        run_test!
      end

      response '404', 'investigator not found' do
        let(:id) { 0 }
        run_test!
      end
    end
  end
end
