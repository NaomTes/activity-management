class CreateProvidedService < ActiveRecord::Migration[6.0]
  def change
    create_table :provided_services do |t|
      t.references :provider, foreign_key: { on_delete: :cascade }
      t.references :service, foreign_key: { on_delete: :cascade }
      t.decimal :price, precision: 10, scale: 2
      t.text :service_description

      t.timestamps
    end
  end
end
