class CreateBookedService < ActiveRecord::Migration[6.0]
  def change
    create_table :booked_services do |t|
      t.references :booking, index: true, foreign_key: { on_delete: :cascade }
      t.references :provided_service, index: true, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
