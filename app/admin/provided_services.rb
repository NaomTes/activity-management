ActiveAdmin.register ProvidedService do
  permit_params :provider_id,
                :service_id,
                :service_description,
                :price,
                :status

  form do |f|
    f.inputs "Provided Services" do
      f.input :provider, as: :select, collection: Provider.all.map { |provider| [provider.email, provider.id] }
      f.input :service
      f.input :service_description
      f.input :price
      f.input :status
    end
    actions
  end

  filter :service
  filter :provider, as: :select, collection: Provider.all.map { |provider| [provider.email, provider.id] }
  filter :service_description
  filter :price
  filter :status
  filter :created_at
  filter :updated_at
end
