class CreateEntityDepartments < ActiveRecord::Migration[7.1]
  def change
    create_table :entity_departments do |t|
      t.references :entity, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
