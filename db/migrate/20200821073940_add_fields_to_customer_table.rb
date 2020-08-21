class AddFieldsToCustomerTable < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :first_name, :string
    add_column :customers, :last_name, :string
    add_column :customers, :age, :integer
    add_column :customers, :postal_code, :integer
    add_column :customers, :city, :string
    add_column :customers, :street, :string
    add_column :customers, :country, :string
  end
end
