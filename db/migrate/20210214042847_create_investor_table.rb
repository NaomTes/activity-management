class CreateInvestorTable < ActiveRecord::Migration[6.0]
  def change
    create_table :investors do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone_number
      t.string :website
      t.string :country, null: false
      t.string :state
      t.string :syndicate_group
      t.string :group_name
      t.string :organization_name
      t.string :investment_stages, array: true, default: []
      t.string :last_investment_stages, array: true, default: []
      t.string :investment_rates
      t.string :investment_category, array: true, default: []
      t.string :investment_industry, array: true, default: []
      t.string :emerging_technologies, array: true, default: []
      t.string :previous_emerging_technologies, array: true, default: []
      t.string :founder_type
      t.string :about_us
      t.string :startup_selected, array: true, default: []
    end
  end
end
