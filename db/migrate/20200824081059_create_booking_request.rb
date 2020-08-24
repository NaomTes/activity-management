class CreateBookingRequest < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_requests do |t|
      t.references :customer, foreign_key: { on_delete: :cascade }
    end
  end
end
