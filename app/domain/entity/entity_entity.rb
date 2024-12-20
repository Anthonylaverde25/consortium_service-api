class EntityEntity
  attr_accessor :id, :name, :description, :email, :consortium_id, :general_manager_id, :departments # :deleted_at

  def initialize(attributes = {})
    @id = attributes[:id] # El id es nil si no se proporciona
    @name = attributes[:name]
    @description = attributes[:description]
    @email = attributes[:email]
    @consortium_id = attributes[:consortium_id]
    @general_manager_id = attributes[:general_manager_id]
    @departments = attributes[:departments] || []

    # @deleted_at = attributes[:deleted_at]
  end


  # def to_entity_attributes(departments)
  #   {
  #     id: @id,
  #     name: @name,
  #     description: @description,
  #     email: @email,
  #     consortium_id: @consortium_id,
  #     general_manager_id: @general_manager_id,
  #     departments: departments # Aquí pasamos la lista de departamentos
  #   }
  # end


  # Método para verificar si la entidad es válida
  def valid?
    errors.empty? # Retorna true si no hay errores
  end

  def errors
    error_messages = []

    if @name.nil? || @name.empty?
      error_messages << "Name can't be blank DESDE LA ENTIDAD"
    end

    if @email.nil? || !@email.match?(URI::MailTo::EMAIL_REGEXP)
      error_messages << "Invalid email format DESDE LA ENTIDAD"
    end

    error_messages
  end
end
