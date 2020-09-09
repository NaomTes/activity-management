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
             :country

  attribute :auth_token, if: Proc.new { |provider, params| params[:auth_token] }
end
