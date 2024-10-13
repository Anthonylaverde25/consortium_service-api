# # db/seeds.rb

# # Crear usuarios si no existen
# super_admin = User.find_or_create_by!(email: 'super_admin@gmail.com') do |user|
#   user.name = 'super_admin'
#   user.lastname = 'administrador'
#   user.password = '12345678'
#   user.password_confirmation = '12345678'
# end

# admin = User.find_or_create_by!(email: 'admin@gmail.com') do |user|
#   user.name = 'admin'
#   user.lastname = 'administrador'
#   user.password = '12345678'
#   user.password_confirmation = '12345678'
# end


# sergio = User.find_or_create_by!(email: 'sergio@gmail.com') do |user|
#   user.name = 'Sergio'
#   user.lastname = 'Cattorini'
#   user.password = '12345678'
#   user.password_confirmation = '12345678'
# end


# # Crear el consorcio si no existe
# consortium = Consortium.find_or_create_by!(name: 'Cattorini Hnos') do |c|
#   c.description = 'Consortium dedicated to the production and distribution of glass products at national and international level'
#   c.address = '123 Glass St'
#   c.city = 'Glassville'
#   c.state_province = 'CA'
#   c.postal_code = '90210'
#   c.country = 'USA'
#   c.registration_number = 'REG123456'
#   c.phone_number = '+1-800-555-1234'
#   c.email = 'info@cattorini.com'
#   c.website = 'http://www.cattorini.com'
#   c.legal_representative = 'John Doe'
#   c.organization_type = 'LLC'
#   c.status = :active # Usar el enum para establecer el estado como 'active'
# end



# # # Crear una entidad(empresa/sucursal)
# rigolleau = Entity.find_or_create_by!(name: 'rigolleau') do |e|
#   e.email = 'rigolleau@gmail.com'
#   e.description = 'Leading company in the manufacture and distribution of glass containers'
#   e.consortium = consortium
# end

# CattoriniHnos_pasco = Entity.find_or_create_by!(name: 'CattoriniPasco') do |e|
#   e.email = 'CristaleriaPasco@gmail.com'
#   e.description = 'Leading company in the manufacture and distribution of glass containers'
#   e.consortium = consortium
# end


# db/seeds.rb

# Crear roles
super_admin_role = Role.find_or_create_by!(name: :super_admin)
admin_role = Role.find_or_create_by!(name: :admin)
user_role = Role.find_or_create_by!(name: :user)
general_manager_role = Role.find_or_create_by!(name: :general_manager)
plant_manager_role = Role.find_or_create_by!(name: :plant_manager)

# Crear usuarios si no existen
super_admin = User.find_or_create_by!(email: 'super_admin@gmail.com') do |user|
  user.name = 'super_admin'
  user.lastname = 'super_Admin'
  user.password = '12345678'
  user.password_confirmation = '12345678'
  user.roles << super_admin_role
  user.roles << user_role # Asignar rol user
end

admin = User.find_or_create_by!(email: 'admin@gmail.com') do |user|
  user.name = 'admin'
  user.lastname = 'admin'
  user.password = '12345678'
  user.password_confirmation = '12345678'
  user.roles << admin_role
  user.roles << user_role # Asignar rol user
end

sergio = User.find_or_create_by!(email: 'sergio@gmail.com') do |user|
  user.name = 'Sergio'
  user.lastname = 'Cattorini'
  user.password = '12345678'
  user.password_confirmation = '12345678'
  user.roles << user_role # Solo rol user
  user.roles << admin_role
end

general_manager = User.find_or_create_by!(email: 'laura.wilson@gmail.com') do |user|
  user.name = 'Laura'
  user.lastname = 'Wilson'
  user.password = '12345678'
  user.password_confirmation = '12345678'
  user.roles << general_manager_role
  user.roles << user_role # Asignar rol user
end

plant_manager = User.find_or_create_by!(email: 'michael.brown@gmail.com') do |user|
  user.name = 'Michael'
  user.lastname = 'Brown'
  user.password = '12345678'
  user.password_confirmation = '12345678'
  user.roles << plant_manager_role
  user.roles << user_role # Asignar rol user
end

# # Más usuarios (Ejemplo de gerentes)
# sales_manager = User.find_or_create_by!(email: 'jessica.davis@gmail.com') do |user|
#   user.name = 'Jessica'
#   user.lastname = 'Davis'
#   user.password = '12345678'
#   user.password_confirmation = '12345678'
#   user.roles << user_role # Solo rol user
# end

# inventory_manager = User.find_or_create_by!(email: 'charles.martinez@gmail.com') do |user|
#   user.name = 'Charles'
#   user.lastname = 'Martinez'
#   user.password = '12345678'
#   user.password_confirmation = '12345678'
#   user.roles << user_role # Solo rol user
# end

# Crear el consorcio si no existe
consortium = Consortium.find_or_create_by!(name: 'Cattorini Hnos') do |c|
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

# Crear entidades (empresas/sucursales)
rigolleau = Entity.find_or_create_by!(name: 'Rigolleau') do |e|
  e.email = 'info@rigolleau.com'
  e.description = 'Leading company in the manufacture and distribution of glass containers'
  e.consortium = consortium
end

cattorini_hnos_pasco = Entity.find_or_create_by!(name: 'Cattorini Pasco') do |e|
  e.email = 'info@cattorinipasco.com'
  e.description = 'Leading company in the manufacture and distribution of glass containers'
  e.consortium = consortium
end
