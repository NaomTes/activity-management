class CreateAvailability < ActiveRecord::Migration[6.0]
  def change
    create_table :availabilities do |t|
      t.references :availability_duration, foreign_key: { on_delete: :cascade }
      t.date :available_one
      t.time :from_time
      t.time :to_time

      t.timestamps
    end
  end
end
