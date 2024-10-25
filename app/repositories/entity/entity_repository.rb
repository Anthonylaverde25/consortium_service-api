class EntityRepository
  def self.get_all_entities
    active_record_entities = Entity.all # #recupero todas las entidades (empresas)

    entities = active_record_entities.map do |record|
      entity = EntityEntity.new(record)
      if entity.errors.any?
        puts "Errors for entity ID #{entity.id}: #{entity.errors.join(', ')} DESDE EL REPO Y LA VALIDACION DE LA ENTIDAD"
      end

      entity
    end



    entities
  end

  def self.create_entity(entity_entity)
    entity_active_record = Entity.create!(entity_entity.instance_values.except("deleted_at"))
    entity_active_record
  end

  # def self.update_entity(entity_instance, entity)
  #   entity.update(entity_instance.instance_values.except("id"))
  #   entity
  #   # Actualiza el registro de la entidad y devuelve la entidad actualizada
  #   # if entity.update(entity_instance.instance_values.except("id"))
  #   #   entity # Devuelve el objeto actualizado
  #   # else
  #   #   false # O maneja el error según tu lógica
  #   # end
  # end

  # def self.update_entity(entity_instance, entity)
  #  entity_updated_record = entity.update!(entity_instance.instance_values.except("id"))
  #  entity_updated_record
  # end

  def self.update_entity(entity_instance, entity)
    entity_updated_record = entity.update!(entity_instance.instance_values.except("id"))
    { updated: entity_updated_record, entity: entity }
  end
end
