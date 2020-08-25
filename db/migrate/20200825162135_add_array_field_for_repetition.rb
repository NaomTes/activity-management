class AddArrayFieldForRepetition < ActiveRecord::Migration[6.0]
  def change
    change_column :availability_durations, :repetition_days, :string,
                  array: true, default: [], using: "(string_to_array(repetition_days, ','))"
  end
end
