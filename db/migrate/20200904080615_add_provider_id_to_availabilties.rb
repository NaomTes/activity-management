class AddProviderIdToAvailabilties < ActiveRecord::Migration[6.0]
  def change
    add_reference :availabilities, :provider, foreign_key: { on_delete: :cascade }
  end
end
