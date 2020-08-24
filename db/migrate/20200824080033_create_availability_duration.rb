class CreateAvailabilityDuration < ActiveRecord::Migration[6.0]
  def change
    create_table :availability_durations do |t|
      t.references :provider, index: true, foreign_key: { on_delete: :cascade }
      t.date :available_one
      t.time :from_time
      t.time :to_time
      t.string :repetition

      t.timestamps
    end
  end
end
