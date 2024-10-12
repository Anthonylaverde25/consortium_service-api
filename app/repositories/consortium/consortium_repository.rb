
class ConsortiumRepository
  def self.get_all_consortiums
    Consortium.all
  end

  def self.get_consortium(id)
    consortium =  Consortium.find_by(id: id)
    raise ActiveRecord::RecordNotFound, "Consortium not found in database. This exception is fired from the consortium repository, and is caught by its usecase" if consortium.nil?

    consortium
  end

  def self.create_consortium(consortium_entity)
    # Consortium.create!(consortium_entity.instance_values)
    consortium = Consortium.create!(consortium_entity.instance_values.except("images"))
    consortium.images.attach(consortium_entity.images) if consortium_entity.images.present?
    consortium
  end

  def self.update_consortium(consortium_to_update, consortium_entity)
    attributes_to_update = consortium_entity.instance_values.except("id", "image")
    consortium_to_update.update(attributes_to_update)

    if consortium_entity.images.present?
      consortium_to_update.image.attach(consortium_entity.images)
    end

    consortium_to_update # Retornar el consorcio actualizado
  end

  def self.delete_consortium(consortium)
    consortium.destroy
  end
end
