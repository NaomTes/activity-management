class Customer::ServiceSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name
end
