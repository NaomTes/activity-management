class AddUniqIndexToReviews < ActiveRecord::Migration[6.0]
  def change
    remove_index :reviews, :booked_service_id
    add_index :reviews, :booked_service_id, unique: true
  end
end
