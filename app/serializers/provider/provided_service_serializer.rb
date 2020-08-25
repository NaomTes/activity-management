class Provider::ProvidedServiceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :service_description,
             :price
  attributes :provider_id do |provided_service|
    provided_service.provider.id
  end
  attributes :service do |provided_service|
    provided_service.service.name
  end
end
