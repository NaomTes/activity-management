ActiveAdmin.register Service do
  permit_params :name

  filter :providers, as: :select, collection: Provider.all.map { |provider| [provider.email, provider.id] }
  filter :name
end
