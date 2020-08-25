class Provider::ProvidedServiceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :service_description,
             :price,
             :provider_id
  attribute :service do |provided_service|
    provided_service.service_name
  end
end
