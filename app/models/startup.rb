class Startup < ActiveRecord::Base
  validates :company_name, uniqueness: true
  
  def self.save_current_record(record_params)
    create_with(record_params).find_or_create_by(company_name: record_params[:company_name])
  end
end
