ActiveAdmin.register ProvidedService do
  permit_params :provider_id,
                :service_id,
                :service_description,
                :price

  filter :service
  filter :provider
  filter :service_description
  filter :price
  filter :created_at
  filter :updated_at
end
