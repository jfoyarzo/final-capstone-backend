require 'swagger_helper'

RSpec.describe 'Appointments API' do
  path '/v1/appointments' do
    post 'Creates an appointment' do
      tags 'Appointments'
      consumes 'application/json'
      request_body_example value: { appointment: {
        user_id: 2,
        investigator_id: 1,
        date: '2022-12-12',
        city: 'Manhattan'
      } },
                           name: 'request_create_appointment',
                           summary: 'A request example for creating an appointment'
      parameter name: :appointment, in: :body, schema: { type: :object,
                                                         properties: {
                                                           appointment: { type: :object,
                                                                          properties: {
                                                                            user_id: { type: :number },
                                                                            investigator_id: { type: :number },
                                                                            date: { type: :date },
                                                                            city: { type: :string }
                                                                          } }
                                                         },
                                                         required: %w[user_id investigator_id date city] }

      response '201', 'appointment created' do
        example 'application/json', :example_response_create_appointment, {
          status: {
            code: 201,
            message: 'Appointment created successfully.'
          },
          data: {
            user_id: 2,
            investigator_id: 1,
            date: '2022-12-12T00:00:00.000Z',
            city: 'Manhattan, NY'
          }
        }
        let(:appointment) { { user_id: 1, investigator_id: 1, date: '2023-05-05 12:00', city: 'Manhattan, NY' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:appointment) { { city: 'Kansas City, AR' } }
        run_test!
      end
    end
  end

  path '/v1/appointments' do
    get 'Retrieves all appointments for the logged in user' do
      tags 'Appointments'
      produces 'application/json'

      response '200', 'appointments found' do
        example 'application/json', :example_response_appointments, [
          {
            id: 1,
            user_id: 1,
            investigator_id: 1,
            date: '2022-12-12T00:00:00.000Z',
            city: 'Manhattan, NY'
          },
          {
            id: 2,
            user_id: 1,
            investigator_id: 3,
            date: '2022-05-07T00:00:00.000Z',
            city: 'Austin, TX'
          }
        ]
        schema type: :array,
               items: { type: :object,
                        properties: {
                          id: { type: :integer },
                          user_id: { type: :integer },
                          investigator_id: { type: :integer },
                          date: { type: :string },
                          city: { type: :string }
                        } }
        run_test!
      end
    end
  end

  path '/v1/appointments/{id}' do
    get 'Retrieves an appointment' do
      tags 'Appointments'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'id found' do
        example 'application/json', :example_response_appointments, {
          id: 1,
          user_id: 2,
          investigator_id: 1,
          date: '2022-12-12T00:00:00.000Z',
          city: 'Manhattan, NY'
        }
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 user_id: { type: :integer },
                 investigator_id: { type: :integer },
                 date: { type: :date },
                 city: { type: :string }
               }

        let(:id) do
          Appointment.create(user_id: 1, investigator_id: 1, date: '2023-05-05 12:00', city: 'Manhattan, NY').id
        end
        run_test!
      end

      response '404', 'appointment not found' do
        let(:id) { 0 }
        run_test!
      end
    end
  end

  path '/v1/appointments/{id}' do
    delete 'Deletes an appointment' do
      tags 'Appointments'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'appointment deleted' do
        example 'application/json', :response_on_delete_appointment, {
          status: {
            code: 200,
            message: 'Appointment deleted successfully.'
          },
          data: {
            id: 1,
            user_id: 2,
            investigator_id: 1,
            date: '2022-12-12T00:00:00.000Z',
            city: 'Manhattan, NY'
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
                           user_id: { type: :integer },
                           investigator_id: { type: :integer },
                           date: { type: :date },
                           city: { type: :string }
                         } }
               }

        let(:id) do
          Appointment.create(user_id: 1,
                             investigator_id: 1,
                             date: '2023-05-05 12:00',
                             city: 'Manhattan, NY').id
        end
        run_test!
      end

      response '404', 'appointment not found' do
        let(:id) { 0 }
        run_test!
      end
    end
  end
end
