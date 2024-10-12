# db/seeds.rb

# Crear usuarios si no existen
super_admin = User.find_or_create_by!(email: 'super_admin@gmail.com') do |user|
  user.name = 'super_admin'
  user.lastname = 'administrador'
  user.password = '12345678'
  user.password_confirmation = '12345678'
end

admin = User.find_or_create_by!(email: 'admin@gmail.com') do |user|
  user.name = 'admin'
  user.lastname = 'administrador'
  user.password = '12345678'
  user.password_confirmation = '12345678'
end


sergio = User.find_or_create_by!(email: 'sergio@gmail.com') do |user|
  user.name = 'Sergio'
  user.lastname = 'Cattorini'
  user.password = '12345678'
  user.password_confirmation = '12345678'
end


# Crear el consorcio si no existe
consortium = Consortium.find_or_create_by!(name: 'Cattorini brothers') do |c|
  c.description = 'Consortium dedicated to the production and distribution of glass products at national and international level'
  c.address = '123 Glass St'
  c.city = 'Glassville'
  c.state_province = 'CA'
  c.postal_code = '90210'
  c.country = 'USA'
  c.registration_number = 'REG123456'
  c.phone_number = '+1-800-555-1234'
  c.email = 'info@cattorini.com'
  c.website = 'http://www.cattorini.com'
  c.legal_representative = 'John Doe'
  c.organization_type = 'LLC'
  c.status = :active # Usar el enum para establecer el estado como 'active'
end



# # Crear una entidad(empresa/sucursal)
rigolleau = Entity.find_or_create_by!(name: 'rigolleau') do |e|
  e.email = 'rigolleau@gmail.com'
  e.description = 'Leading company in the manufacture and distribution of glass containers'
  e.consortium = consortium
end
