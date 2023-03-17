class V1::InvestigatorsController < ApplicationController
  # before_action :authenticate_user!, only: %i[create destroy]

  def index
    @investigators = Investigator.all
    render json: @investigators
  end

  def show
    if Investigator.exists?(params[:id])
      set_investigator
      render json: @investigator
    else
      render json: { code: 404, message: 'Investigator not found' }, status: 404
    end
  end

  def create
    @investigator = Investigator.new(investigator_params)
    if @investigator.save
      render json: {
        status: { code: 201, message: 'Investigator created successfully.' },
        data: InvestigatorSerializer.new(@investigator).serializable_hash[:data][:attributes]
      }, status: 201
    else
      render json: {
        status: { message: "Investigator could not be created. #{@investigator.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end

  def destroy
    if Investigator.exists?(params[:id])
      set_investigator
      if @investigator.destroy
        render json: {
          status: { code: 200, message: 'Investigator deleted successfully.' },
          data: InvestigatorSerializer.new(@investigator).serializable_hash[:data][:attributes]
        }, status: :ok
      else
        render json: {
          status: { message: "Investigator could not be deleted. #{@investigator.errors.full_messages.to_sentence}" }
        }, status: 500
      end
    else
      render json: { code: 404, message: 'Investigator not found' }, status: 404
    end
  end

  private

  def set_investigator
    @investigator = Investigator.find(params[:id])
  end

  def investigator_params
    params.require(:investigator).permit(:name, :photo, :description, :fee, :rating)
  end
end
