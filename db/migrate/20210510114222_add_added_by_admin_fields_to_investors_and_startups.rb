class AddAddedByAdminFieldsToInvestorsAndStartups < ActiveRecord::Migration[6.0]
  def change
    add_column :investors, :added_by_admin, :boolean, default: false
    add_column :startups, :added_by_admin, :boolean, default: false
  end
end
