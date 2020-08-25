class Provider::ProviderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name,
             :last_name,
             :email,
             :age,
             :profile_description,
             :base_price,
             :street,
             :city,
             :postal_code,
             :country,
             :auth_token
end
