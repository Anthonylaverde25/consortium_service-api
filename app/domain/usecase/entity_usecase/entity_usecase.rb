class EntityUsecase
  class FindAllEntities
    def initialize(entity_repository = EntityRepository)
      @entity_repository = entity_repository
    end

    def call
      @entity_repository.get_all_entities
    rescue StandardError => e
      Rails.logger.error("Error finding entities DESDE EL CASO DE USO: #{e.message}")
    raise
    end
  end
end
