class CreateBooking < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :customer, index: true, foreign_key: { on_delete: :cascade }
    end
  end
end
