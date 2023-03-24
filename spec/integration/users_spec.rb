require 'swagger_helper'

RSpec.describe 'Authentication API' do
  path '/users' do
    post 'Signs up a new user' do
      tags 'Authentication'
      consumes 'application/json'
      request_body_example value: {
                             user: {
                               name: 'John Doe',
                               email: 'jdoe@mail.com',
                               password: 'Securepass123#'
                             }
                           },
                           name: 'request_signup_user',
                           summary: 'A request example for signin up a new user'
      parameter name: :user, in: :body, schema: { type: :object,
                                                  properties: {
                                                    user: { type: :object,
                                                            properties: {
                                                              name: { type: :string },
                                                              email: { type: :string },
                                                              password: { type: :string },
                                                              password_confirmation: { type: :string }
                                                            } }
                                                  },
                                                  required: %w[name email password] }

      response '201', 'user created' do
        example 'application/json', :example_response_create_user, {
          status: {
            code: 200,
            message: 'Signed up successfully.'
          },
          data: {
            id: 3,
            name: 'John Doe',
            email: 'jdoe@mail.com',
            created_at: '2023-03-14T21:48:13.152Z'
          }
        }
        let(:user) do
          { name: 'John Doe',
            email: 'jdoe@mail.com',
            password: 'Securepass123#' }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: 'John Doe' } }
        run_test!
      end
    end
  end

  path '/users/sign_in' do
    post 'Logs in a user and creates a new session cookie' do
      tags 'Authentication'
      consumes 'application/json'
      request_body_example value: {
                             user: {
                               email: 'jdoe@mail.com',
                               password: 'Securepass123#'
                             }
                           },
                           name: 'request_signin_user',
                           summary: 'A request example for logging in a user'
      parameter name: :user, in: :body, schema: { type: :object,
                                                  properties: {
                                                    user: { type: :object,
                                                            properties: {
                                                              email: { type: :string },
                                                              password: { type: :string }
                                                            } }
                                                  },
                                                  required: %w[email password] }

      response '200', 'user found' do
        example 'application/json', :example_response_userlogin, {
          status: {
            code: 200,
            message: 'Signed in successfully.'
          },
          data: {
            id: 3,
            name: 'John Doe',
            email: 'jdoe@mail.com',
            created_at: '2023-03-14T21:48:13.152Z'
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
                           id: { type: :integer },
                           name: { type: :string },
                           email: { type: :string },
                           created_at: { type: :string }
                         } }
               }
        run_test!
      end

      response '401', 'Unauthorized' do
        let(:user) { { email: 'not_registered@mail.com', password: '123456Ab$' } }
        run_test!
      end
    end
  end

  path '/users/sign_out' do
    delete 'Signs out a user' do
      tags 'Authentication'
      produces 'application/json'

      response '200', 'user signed out' do
        example 'application/json', :response_on_logout, {
          status: {
            code: 200,
            message: 'Signed out successfully.'
          }
        }
        schema type: :object,
               properties: {
                 status: { type: :object,
                           properties: {
                             code: { type: :integer },
                             message: { type: :string }
                           } }
               }
        run_test!
      end

      response '401', 'no signed in user found' do
        example 'application/json', :response_on_failed_logout, {
          status: {
            code: 401,
            message: 'Could not find a signed in user.'
          }
        }
        schema type: :object,
               properties: {
                 status: { type: :object,
                           properties: {
                             code: { type: :integer },
                             message: { type: :string }
                           } }
               }
        run_test!
      end
    end
  end
end
