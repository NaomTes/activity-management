class Provider::ProvidedServiceSerializer
  include FastJsonapi::ObjectSerializer

  attributes :service_description,
             :price,
             :provider_id,
             :service_name
end
