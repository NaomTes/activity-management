class JwtDenylist < ActiveRecord::Base
  include Devise::JWT::RevocationStrategies::Denylist

  self.table_name = 'jwt_denylists'
end