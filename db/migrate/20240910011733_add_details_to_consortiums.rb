class AddDetailsToConsortiums < ActiveRecord::Migration[7.1]
  def change
    add_column :consortiums, :email, :string, null: false
    add_column :consortiums, :phone_number, :string, null: false
    add_column :consortiums, :registration_number, :string
    add_column :consortiums, :legal_representative, :string, null: false
    add_column :consortiums, :country, :string
    add_column :consortiums, :state_province, :string
    add_column :consortiums, :city, :string
    add_column :consortiums, :address, :string
    add_column :consortiums, :postal_code, :string
    add_column :consortiums, :website, :string
    add_column :consortiums, :organization_type, :string
    add_column :consortiums, :status, :integer, default: 0, null: false
  end
end
