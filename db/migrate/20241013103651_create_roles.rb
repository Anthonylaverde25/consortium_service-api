class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles do |t|
      t.integer :name

      t.timestamps
    end
  end
end
