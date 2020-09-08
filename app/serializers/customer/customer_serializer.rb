class Customer::CustomerSerializer
  include FastJsonapi::ObjectSerializer

  attributes :first_name,
             :last_name,
             :email,
             :age,
             :phone_number,
             :street,
             :city,
             :postal_code,
             :country,
             :auth_token
end
