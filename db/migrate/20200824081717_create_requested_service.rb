class CreateRequestedService < ActiveRecord::Migration[6.0]
  def change
    create_table :requested_services do |t|
      t.references :provided_service, index: true, foreign_key: { on_delete: :cascade }
      t.references :booking_request, index: true, foreign_key: { on_delete: :cascade }
    end
  end
end
