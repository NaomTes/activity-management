class AddColumnsInTable < ActiveRecord::Migration[6.0]
  def change
    add_column :startups, :investor_selected, :string, array: true, default: []
    add_column :investors, :startup_selected, :string, array: true, default: []
  end
end
