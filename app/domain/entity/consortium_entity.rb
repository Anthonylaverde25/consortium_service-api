class ConsortiumEntity
  # Definir los atributos que represenan las propiedades del consorcio
  # Emplear attr_accessor define los atributos, permitiendo que se lean y se escriban
  # Define automaticamente los setter y getter
  attr_accessor :id, :name, :description, :email, :phone_number,
  :legal_representative, :status, :registration_number,
  :country, :state_province, :city, :address,
  :postal_code, :website, :organization_type, :images, :deleted_at


  def initialize(attributes = {})
    @id = attributes[:id]  # El ID será nil si no se proporciona
    @name = attributes[:name]
    @description = attributes[:description]
    @email = attributes[:email]
    @phone_number = attributes[:phone_number]
    @legal_representative = attributes[:legal_representative]
    @status = attributes[:status]
    @registration_number = attributes[:registration_number]
    @country = attributes[:country]
    @state_province = attributes[:state_province]
    @city = attributes[:city]
    @address = attributes[:address]
    @postal_code = attributes[:postal_code]
    @website = attributes[:website]
    @organization_type = attributes[:organization_type]
    @images = attributes[:images] || []  # Inicializa como un array vacío
    @deleted_at = attributes[:deleted_at]
  end

  def valid?
    !@name.nil? && !@name.empty? &&
    !@email.nil? && @email.match?(URI::MailTo::EMAIL_REGEXP)
  end

  def errors
    error_messages = []
    error_messages << "Name can't be blank" if @name.nil? || @name.empty?
    error_messages << "Invalid email format" if @email && !@email.match?(URI::MailTo::EMAIL_REGEXP)
    # Agrega más validaciones según sea necesario
    error_messages
  end
end
