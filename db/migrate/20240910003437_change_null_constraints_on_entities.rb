class ChangeNullConstraintsOnEntities < ActiveRecord::Migration[7.1]
  def change
    change_column_null :entities, :name, false
    change_column_null :entities, :email, false
  end
end
