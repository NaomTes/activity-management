class CreateBookedService < ActiveRecord::Migration[6.0]
  def change
    create_table :booked_services do |t|
      t.references :booking, foreign_key: { on_delete: :cascade }
      t.references :provided_service, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
