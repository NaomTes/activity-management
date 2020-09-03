class AddSlotsOffsetToAvailabilityDuration < ActiveRecord::Migration[6.0]
  def change
    add_column :availability_durations, :slots_offset, :integer
  end
end
