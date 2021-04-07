module Authentication

  def encode_token(payload)
    payload[:exp] = Time.now.to_i + 1.day.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def decoded_token
    token = session[:user_session]
    if token
      begin
        JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def set_current_user
    @current_user   = nil
    if decoded_token
      user_id       = decoded_token[0]['user_id']
      @current_user = User.find_by(id: user_id)
    end
    @current_user
  end

  def user_authorized
    render json: { message: 'Please log in First to Continue' }, status: 401 unless @current_user
  end
end