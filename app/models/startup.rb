class Startup < ActiveRecord::Base
  
  def self.save_current_record(record_params)
    create_with(record_params).find_or_create_by(email: record_params[:email])
  end
end
