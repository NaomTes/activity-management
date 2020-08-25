class ChangeRepetitionFieldForDuration < ActiveRecord::Migration[6.0]
  def change
    rename_column :availability_durations, :repetition, :repetition_days
    add_column :availability_durations, :repetition, :integer
    rename_column :availability_durations, :available_one, :starting_date
  end
end
