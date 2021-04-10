class AddFoundersInfoToStartups < ActiveRecord::Migration[6.0]
  def change
    add_column :startups, :founders_information, :string, default: ''
  end
end
