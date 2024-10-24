class CreateEntitiesUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :entities_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :entity, null: false, foreign_key: true
      t.timestamps
    end


    # Eliminar el índice único para permitir múltiples asociaciones
    # add_index :entities_users, [:user_id, :entity_id] # Sin 'unique: true'
  end
end
