class AddGeneralManagerToEntities < ActiveRecord::Migration[7.1]
  def change
    add_column :entities, :general_manager_id, :bigint
    add_foreign_key :entities, :users, column: :general_manager_id
    add_index :entities, :general_manager_id
  end
end
