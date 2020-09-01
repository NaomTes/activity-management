class AddStatusToProvidedServices < ActiveRecord::Migration[6.0]
  def change
    add_column :provided_services, :status, :boolean, default: true
  end
end
