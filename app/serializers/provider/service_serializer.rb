class Provider::ServiceSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name
end
