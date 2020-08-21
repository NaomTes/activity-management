class ChangeEmailFieldForProvider < ActiveRecord::Migration[6.0]
  def change
    change_column :providers, :email, :string, :null => false, :default => ""
  end
end
