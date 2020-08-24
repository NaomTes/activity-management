class AddBookedServiceReferenceToAvailability < ActiveRecord::Migration[6.0]
  def change
    add_reference :availabilities, :booked_service, index: true, foreign_key: { on_delete: :cascade }
  end
end
