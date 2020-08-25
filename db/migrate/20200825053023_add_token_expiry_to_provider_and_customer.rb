class AddTokenExpiryToProviderAndCustomer < ActiveRecord::Migration[6.0]
  def change
    add_column :providers, :token_expires_at, :string
    add_column :customers, :token_expires_at, :string
  end
end
