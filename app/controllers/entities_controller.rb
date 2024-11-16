


class EntitiesController < ApplicationController
  include ErrorHandler  # Incluye el módulo de manejo de errores

  before_action :authenticate_user!
  before_action :set_entity, only: %i[show update destroy]

  # GET /entities
  def index
    use_case = EntityUsecase::FindAllEntities.new
      @entities = use_case.call

     # binding.pry

     render json: Presenter::EntityPresenter.as_json(@entities)
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
    use_case = EntityUsecase::CreateEntity.new

    begin
      saved_entity = use_case.call(entity_params)
      render json: saved_entity, status: :created
    rescue ActiveRecord::RecordInvalid => e
      handle_record_invalid_error(e)  # Manejo de errores usando el concern
    rescue StandardError => e
      handle_standard_error(e)  # Manejo de errores usando el concern
    end
  end







  def update
    use_case = EntityUsecase::UpdateEntity.new
    begin
      updated_entity = use_case.call(entity_params, @entity)
      render json: updated_entity, status: :ok
    rescue ActiveRecord::RecordInvalid => e
      # Rails.logger.error("Desde el controlador: #{e.message}")
      handle_record_invalid_error(e)  # Manejo de errores usando el concern
    rescue StandardError => e
      handle_standard_error(e)  # Manejo de errores usando el concern
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
    params.require(:entity).permit(:name, :description, :email, :consortium_id, :general_manager_id)
  end
end
