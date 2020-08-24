class AddAvailabilityReferenceToRequestedService < ActiveRecord::Migration[6.0]
  def change
    add_reference :requested_services, :availability, index: true, foreign_key: { on_delete: :cascade }
  end
end
