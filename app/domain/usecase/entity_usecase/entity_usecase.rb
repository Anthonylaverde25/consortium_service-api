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

    def call(entity_params)
      entity_entity = EntityEntity.new(entity_params)

      unless entity_entity.valid?
        raise StandardError.new(entity_entity.errors.join(", "))
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

  # class UpdateEntity
  #   def initialize(entity_repository = EntityRepository)
  #     @entity_repository = entity_repository
  #   end

  #   def call(entity_params, entity)
  #     entity_instance = EntityEntity.new(entity_params)

  #     if entity_instance.nil?
  #       raise StandardError.new("Entity(empresa) not found")
  #     end

  #     entity_updated = @entity_repository.update_entity(entity_instance, entity)
  #     entity_updated
  #   end
  # end


  class UpdateEntity
    def initialize(entity_repository = EntityRepository)
      @entity_repository = entity_repository
    end

    def call(entity_params, entity)
      entity_instance = EntityEntity.new(entity_params)

      if entity_instance.nil?
        raise StandardError.new("Entity(empresa) not found")
      end

      entity_updated = @entity_repository.update_entity(entity_instance, entity)
      entity_updated
    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.error("Error Updating entity (empresa) DESDE EL CASO DE USO: #{e.message}")
      raise
    end
  end
end
