class V1::AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @appointments = current_user.appointments
    render json: @appointments
  end

  def show
    if Appointment.exists?(params[:id])
      set_appointment
      render json: @appointment
    else
      render json: { code: 404, message: 'Appointment not found' }, status: 404
    end
  end

  def create
    @appointment = current_user.appointments.new(appointment_params)
    if @appointment.save
      render json: {
        status: { code: 201, message: 'Appointment created successfully.' },
        data: AppointmentSerializer.new(@appointment).serializable_hash[:data][:attributes]
      }, status: 201
    else
      render json: {
        status: { message: "Appointment could not be created. #{@appointment.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end

  def destroy
    if Appointment.exists?(params[:id])
      set_appointment
      if @appointment.destroy
        render json: {
          status: { code: 200, message: 'Appointment deleted successfully.' },
          data: AppointmentSerializer.new(@appointment).serializable_hash[:data][:attributes]
        }, status: :ok
      else
        render json: {
          status: { message: "Appointment could not be deleted. #{@appointment.errors.full_messages.to_sentence}" }
        }, status: :unprocessable_entity
      end
    else
      render json: { code: 404, message: 'Appointment not found' }, status: 404
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:investigator_id, :date, :city)
  end
end
