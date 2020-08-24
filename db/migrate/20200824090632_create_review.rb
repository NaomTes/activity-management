class CreateReview < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :booked_service, index: true, foreign_key: { on_delete: :cascade }
      t.text :comments
      t.integer :ratings
      t.timestamps
    end
  end
end
