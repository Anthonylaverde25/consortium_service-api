class AddDescriptionToRoles < ActiveRecord::Migration[7.1]
  def change
    add_column :roles, :description, :string, null: true
  end
end
