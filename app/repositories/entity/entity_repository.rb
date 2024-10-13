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

    if entities.empty?
      raise ActiveRecord::RecordNotFound, "No entities found in the database."
    end

    entities
  end
end
