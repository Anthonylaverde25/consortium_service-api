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
   # binding.pry

   # entity_entity = EntityEntity.new(entity_params) # Crear una nueva entidad
   entity_entity = EntityEntity.new(entity_params.to_h.symbolize_keys)

    use_case = EntityUsecase::CreateEntity.new

    begin
      saved_entity = use_case.call(entity_entity)
      render json: saved_entity, status: :created
    rescue ActiveRecord::RecordInvalid => e
      # Maneja errores de validación específicos de ActiveRecord
      handle_record_invalid_error(e)
    rescue StandardError => e
      # Maneja cualquier otro error inesperado
      handle_standard_error(e)
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

  def handle_record_invalid_error(error)
    Rails.logger.error("Error creating entity (company): #{error.message} DESDE EL CONTROLADOR")
    render json: { errors: error.message }, status: :unprocessable_entity
  end

  def handle_standard_error(error)
    Rails.logger.error("Unexpected error: #{error.message} DESDE EL CONTROLADOR")
    render json: { errors: "An unexpected error occurred." }, status: :internal_server_error
  end

  # Only allow a list of trusted parameters through.
  def entity_params
    params.require(:entity).permit(:id, :name, :description, :email, :consortium_id)
  end
end
