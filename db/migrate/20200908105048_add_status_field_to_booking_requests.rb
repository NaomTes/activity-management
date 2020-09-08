class AddStatusFieldToBookingRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :booking_requests, :status, :integer, default: 0
  end
end
