class ConsortiumUsecase
  class FindConsortium
    def initialize(consortium_repository = ConsortiumRepository)
      @consortium_repository = consortium_repository
    end


    def call(id)
      @consortium_repository.get_consortium(id)

    rescue StandardError => e
      Rails.logger.error("Error finding consortium FROM el RESCUE to USECASE: #{e.message}")
      raise
    end
  end

  class FindAllConsortium
    def initialize(consortium_repository = ConsortiumRepository)
      @consortium_repository = consortium_repository
    end

    def call
      @consortium_repository.get_all_consortiums
    rescue StandardError => e
      Rails.logger.error("Error finding consortium: #{e.message}")
    raise
    end
  end


  class CreateConsortium
    def initialize(consortium_repository = ConsortiumRepository)
      @consortium_repository = consortium_repository
    end

    def call(consortium_params)
      consortium_entity = ConsortiumEntity.new(consortium_params)
      begin
        if consortium_entity.valid?
          @consortium_repository.create_consortium(consortium_entity)
        else
          raise StandardError.new(consortium_entity.errors.full_messages.join(", "))
        end
      rescue ActiveRecord::RecordInvalid => e
        Rails.logger.error("Error creating consortium: #{e.message}")
        raise
      end
    end
  end





  class UpdateConsortium
    def initialize(consortium_repository = ConsortiumRepository)
      @consortium_repository = consortium_repository
    end

    def call(consortium_to_update, consortium_params)
      consortium_entity = ConsortiumEntity.new(consortium_params)

      if consortium_entity.nil?
        raise StandardError.new("Consortium not  found")
      end

     consortium_updated =  @consortium_repository.update_consortium(consortium_to_update, consortium_entity)
     consortium_updated

    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.error("Error updating consortium: #{e.message}")
      raise
    end
  end





  class DeleteConsortium
    def initialize(consortium_repository = ConsortiumRepository)
      @consortium_repository = consortium_repository
    end

    def call(consortium)
      if consortium.nil?
        raise StandardError.new("Consortium not found")
      end

      @consortium_repository.delete_consortium(consortium)
    rescue ActiveRecord::RecordNotFound => e
      Rails.logger.error("Error deleting consortium: #{e.message}")
      raise
    end
  end
end
