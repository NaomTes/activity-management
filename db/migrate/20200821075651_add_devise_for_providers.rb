class AddDeviseForProviders < ActiveRecord::Migration[6.0]
  def change
    remove_column :providers, :password_digest
    add_column :providers, :encrypted_password, :string, :null => false, :default => ""
    add_column :providers, :reset_password_token, :string
    add_column :providers, :reset_password_sent_at, :datetime
    add_column :providers, :remember_created_at, :datetime

    add_index :providers, :email, unique: true
    add_index :providers, :reset_password_token, unique: true
  end
end
