class V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @appointments = current_user.appointments
    render json: @appointments
  end

  def show
    render json: @appointment
  end

  def create
    @appointment = Appointment.new(appointment_params)
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
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:user_id, :investigator_id, :date, :city)
  end
end