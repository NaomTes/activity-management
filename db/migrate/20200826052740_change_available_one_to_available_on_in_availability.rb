class ChangeAvailableOneToAvailableOnInAvailability < ActiveRecord::Migration[6.0]
  def change
    rename_column :availabilities, :available_one, :available_on
  end
end
