class AddOtherFieldsToStartups < ActiveRecord::Migration[6.0]
  def change
    add_column :startups, :investment_industry_other, :string
    add_column :startups, :investment_category_other, :string
    add_column :startups, :previous_emerging_technology_other, :string
    add_column :startups, :emerging_technology_other, :string
  end
end
