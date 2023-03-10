class InvestigatorsController < ApplicationController
  before_action :set_investigator, only: [:show, :destroy]
  def index
    @investigators = Investigator.all
    render json: @investigators
  end

  def show
    render json: @investigator
  end

  def create
    @investigator = Investigator.new(investigator_params)
    if @investigator.save
      render json: {
        status: { code: 201, message: 'Investigator created successfully.' },
        data: InvestigatorSerializer.new(@investigator).serializable_hash[:data][:attributes]
      }
    else
      render json: {
        status: { message: "Investigator could not be created. #{@investigator.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end

  def destroy
    if @investigator.destroy
      render json: {
        status: { code: 204, message: 'Investigator deleted successfully.' },
        data: InvestigatorSerializer.new(@investigator).serializable_hash[:data][:attributes]
      }
    else
      render json: {
        status: { message: "Investigator could not be deleted. #{@investigator.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
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
