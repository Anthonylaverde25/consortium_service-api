module Auth
  class SessionsController < DeviseTokenAuth::SessionsController
    def create
      # Llamamos a `super` para manejar el proceso estándar de inicio de sesión
      super do |resource|
        # Si la autenticación es exitosa, personalizamos la respuesta
        if resource.persisted?
          # Obtenemos los nombres de los roles sin modificar la asociación de roles
          roles = resource.roles.map(&:name)

          # Renderizamos el current_user con los roles incluidos
          render json: {
            current_user: resource.as_json.merge(roles: roles),  # Agregamos los roles como parte del JSON
            message: "Signed in successfully"
          }
          return
        end
      end
    end
  end
end
