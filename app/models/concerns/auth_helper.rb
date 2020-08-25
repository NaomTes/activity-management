module AuthHelper
  def auth_token
    JsonWebToken.encode({ "#{self.class.name.downcase}_id": self.id, exp: auth_expires_at })
  end

  def regenerate_auth_token
    JsonWebToken.encode({ "#{self.class.name.downcase}_id": self.id, exp: update_token_expire_time })
  end

  private

  def auth_expires_at
    return self.token_expires_at.to_i if self.token_expires_at.present?
    update_token_expire_time
  end

  def update_token_expire_time
    expire_time = Time.now.to_i + 1.month
    self.update token_expires_at: expire_time
    expire_time
  end
end
