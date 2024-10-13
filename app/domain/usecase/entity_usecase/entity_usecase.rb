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


  class CreateEntity
    def initialize(entity_repository = EntityRepository)
      @entity_repository = entity_repository
    end

    def call(entity_entity)
      unless entity_entity.valid?
        raise StandardError.new(entity_entity.errors)
      end

      @entity_repository.create_entity(entity_entity)
    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.error("Error creating entity (company): #{e.message}")
      raise
    rescue StandardError => e
      Rails.logger.error("Unexpected error: #{e.message}")
      raise
    end
  end
end
