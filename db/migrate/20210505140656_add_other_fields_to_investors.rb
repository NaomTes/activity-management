class AddOtherFieldsToInvestors < ActiveRecord::Migration[6.0]
  def change
    add_column :investors, :investment_industry_other, :string
    add_column :investors, :investment_category_other, :string
    add_column :investors, :emerging_technology_other, :string
    add_column :investors, :previous_emerging_technology_other, :string
  end
end
