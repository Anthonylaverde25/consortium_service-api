module Presenter
  module EntityPresenter
    def self.as_json(entities)
      entities.map do |entity|
        {
          id: entity.id,
          name: entity.name,
          description: entity.description,
          email: entity.email,
          consortium_id: entity.consortium_id,
          general_manager_id: entity.general_manager_id,
          departments: entity.departments.map do |department|
            {
              id: department.id,
              name: department.name
            }
          end
        }
      end
    end
  end
end
