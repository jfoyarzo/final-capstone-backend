require 'swagger_helper'

RSpec.describe 'Appointments API' do
  path '/v1/appointments' do
    post 'Creates an appointment' do
      tags 'Appointments'
      consumes 'application/json'
      parameter name: :appointment, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :datetime },
          city: { type: :string }
        },
        required: %w[date city]
      }

      response '201', 'appointment created' do
        let(:appointment) { { user_id: 1, investigator_id: 1, date: '2023-05-05 12:00', city: 'Manhattan, NY' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:appointment) { { city: 'Kansas City, AR' } }
        run_test!
      end
    end
  end

  path '/v1/appoitments/{id}' do
    get 'Retrieves an appointment' do
      tags 'Appointments'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'id found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 date: { type: :datetime },
                 city: { type: :string }
               },
               required: %w[date city]

        let(:id) do
          Appointment.create(user_id: 1, investigator_id: 1,
                             date: '2023-05-05 12:00', city: 'Manhattan, NY').id
        end
        run_test!
      end

      response '404', 'appointment not found' do
        let(:id) { 99 }
        run_test!
      end
    end
  end
end
