class AddDeletedAtToConsortiums < ActiveRecord::Migration[7.1]
  def change
    add_column :consortiums, :deleted_at, :datetime
    add_index :consortiums, :deleted_at
  end
end
