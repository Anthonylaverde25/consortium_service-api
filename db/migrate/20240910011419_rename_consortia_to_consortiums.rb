class RenameConsortiaToConsortiums < ActiveRecord::Migration[7.1]
  def change
    rename_table :consortia, :consortiums
  end
end
