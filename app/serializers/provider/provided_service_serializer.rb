class Provider::ProvidedServiceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :service_description,
             :price,
             :provider_id
  attribute :service_name do |provided_service|
    provided_service.name
  end
end
