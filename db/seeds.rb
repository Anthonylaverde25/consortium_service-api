# db/seeds.rb

# Crear roles y guardar en variables
super_admin_role = Role.find_or_create_by!(name: :super_admin) do |role|
  role.description = 'Super administrator with full access to all features.'
end

admin_role = Role.find_or_create_by!(name: :admin) do |role|
  role.description = 'Administrator with permissions to manage users and settings.'
end

employee_role = Role.find_or_create_by!(name: :employee) do |role|
  role.description = 'Regular user with limited access to features.'
end

general_manager_role = Role.find_or_create_by!(name: :general_manager) do |role|
  role.description = 'General manager responsible for overseeing operations.'
end

plant_manager_role = Role.find_or_create_by!(name: :plant_manager) do |role|
  role.description = 'Plant manager overseeing production and staff in the facility.'
end

# Crear usuarios si no existen
super_admin = User.find_or_create_by!(email: 'super_admin@gmail.com') do |user|
  user.name = 'super_admin'
  user.lastname = 'super_Admin'
  user.password = '12345678'
  user.password_confirmation = '12345678'
  user.roles << employee_role # Asignar rol user
  user.roles << super_admin_role
end

admin = User.find_or_create_by!(email: 'admin@gmail.com') do |user|
  user.name = 'admin'
  user.lastname = 'admin'
  user.password = '12345678'
  user.password_confirmation = '12345678'
  user.roles << employee_role # Asignar rol user
  user.roles << admin_role
end

sergio_admin = User.find_or_create_by!(email: 'sergio@gmail.com') do |user|
  user.name = 'Sergio'
  user.lastname = 'Cattorini'
  user.password = '12345678'
  user.password_confirmation = '12345678'
  user.roles << employee_role # Asignar rol user
  user.roles << admin_role
end

general_manager_1 = User.find_or_create_by!(email: 'laura.wilson@gmail.com') do |user|
  user.name = 'Laura'
  user.lastname = 'Wilson'
  user.password = '12345678'
  user.password_confirmation = '12345678'
  user.roles << employee_role # Asignar rol user
  user.roles << general_manager_role
end

general_manager_2 = User.find_or_create_by!(email: 'sonia.cartson@gmail.com') do |user|
  user.name = 'Sonia'
  user.lastname = 'Cartson'
  user.password = '12345678'
  user.password_confirmation = '12345678'
  user.roles << employee_role # Asignar rol user
  user.roles << general_manager_role
end

plant_manager_1 = User.find_or_create_by!(email: 'michael.brown@gmail.com') do |user|
  user.name = 'Michael'
  user.lastname = 'Brown'
  user.password = '12345678'
  user.password_confirmation = '12345678'
  user.roles << employee_role # Asignar rol user
  user.roles << plant_manager_role
end

plant_manager_2 = User.find_or_create_by!(email: 'gustavo.bolivar@gmail.com') do |user|
  user.name = 'Gustavo'
  user.lastname = 'Bolivar'
  user.password = '12345678'
  user.password_confirmation = '12345678'
  user.roles << employee_role # Asignar rol user
  user.roles << plant_manager_role
end

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
  e.general_manager = general_manager_1 # Asignar gerente general
end

cattorini_hnos_pasco = Entity.find_or_create_by!(name: 'Cattorini Pasco') do |e|
  e.email = 'info@cattorinipasco.com'
  e.description = 'Leading company in the manufacture and distribution of glass containers'
  e.consortium = consortium
  e.general_manager = general_manager_2 # Asignar gerente general
end



hr_department = Department.find_or_create_by!(name: 'HR')
production_department = Department.find_or_create_by!(name: 'Produccion')
quality_control_department = Department.find_or_create_by!(name: 'Control de Calidad')

# Asociar departamentos a las entidades
EntityDepartment.find_or_create_by!(entity: rigolleau, department: hr_department)
EntityDepartment.find_or_create_by!(entity: rigolleau, department: production_department)
EntityDepartment.find_or_create_by!(entity: rigolleau, department: quality_control_department)

EntityDepartment.find_or_create_by!(entity: cattorini_hnos_pasco, department: hr_department)
EntityDepartment.find_or_create_by!(entity: cattorini_hnos_pasco, department: production_department)
EntityDepartment.find_or_create_by!(entity: cattorini_hnos_pasco, department: quality_control_department)

# Asociar usuarios a las entidades
EntitiesUser.find_or_create_by!(entity: rigolleau, user: general_manager_1)
EntitiesUser.find_or_create_by!(entity: rigolleau, user: plant_manager_1)

EntitiesUser.find_or_create_by!(entity: cattorini_hnos_pasco, user: general_manager_2)
EntitiesUser.find_or_create_by!(entity: cattorini_hnos_pasco, user: plant_manager_2)
