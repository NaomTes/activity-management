class AddFieldsToProviders < ActiveRecord::Migration[6.0]
  def change
    rename_column :providers, :username, :first_name
    add_column :providers, :last_name, :string
    add_column :providers, :profile_description, :string
    add_column :providers, :base_price, :integer
    add_column :providers, :postal_code, :integer
    add_column :providers, :city, :string
    add_column :providers, :street, :string
    add_column :providers, :country, :string
  end
end
