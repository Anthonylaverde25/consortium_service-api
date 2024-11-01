class EntityUsecase
  class FindAllEntities
    def initialize(entity_repository = EntityRepository)
      @entity_repository = entity_repository
    end

    def call
      entities = @entity_repository.get_all_entities

      entities_with_departments = entities.map do |entity_data|
        # Crear instancias de DepartmentEntity usando attributes directamente
        departments = entity_data.departments.map do |department_data|
          DepartmentEntity.new(department_data)
        end




        entity_attributes = {
          id: entity_data.id,
          name: entity_data.name,
          description: entity_data.description,
          email: entity_data.email,
          consortium_id: entity_data.consortium_id,
          general_manager_id: entity_data.general_manager_id,
          departments: departments # Añadir departamentos aquí
        }

        # Crear instancia de EntityEntity con el hash combinado
        EntityEntity.new(entity_attributes)
      end

      entities_with_departments # Retornar la lista de entidades con departamentos
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
