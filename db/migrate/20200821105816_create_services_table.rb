class CreateServicesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name
    end
  end
end
