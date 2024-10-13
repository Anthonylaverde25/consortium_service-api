class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[ show update destroy ]

  # GET /entities
  def index
    use_case = EntityUsecase::FindAllEntities.new
    @entities = use_case.call
    render json: @entities

  rescue StandardError => e
    Rails.logger.error("Error retrieving all entities (companies) DESDE EL CONTROLADOR: #{e.message}")
    render json: { error: "Internal Server Error" }, status: :internal_server_error
  end

  # GET /entities/1
  def show
    render json: @entity
  end

  # POST /entities
  def create
    @entity = Entity.new(entity_params)

    if @entity.save
      render json: @entity, status: :created, location: @entity
    else
      render json: @entity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entities/1
  def update
    if @entity.update(entity_params)
      render json: @entity
    else
      render json: @entity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entities/1
  def destroy
    @entity.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity
      @entity = Entity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entity_params
      params.require(:entity).permit(:name, :description, :email, :consortium_id)
    end
end
