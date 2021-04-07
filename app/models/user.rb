class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
         #:recoverable, :rememberable, :validatable, :registerable

  def is_admin?
    user_type == ADMIN
  end

  def bulk_upload_data(records)
    investor_records = records.select{ |record| record[:type] == 'investor' }
    startup_records  = records.select{ |record| record[:type] == 'startup' }
    saved_records    = []
    failed_records   = []

    s_records, f_records = save_bulk_investors(investor_records)
    saved_records  += s_records
    failed_records += f_records

    s_records, f_records = save_bulk_startups(startup_records)
    saved_records  += s_records
    failed_records += f_records
    return failed_records + saved_records
  end

  def save_bulk_investors(investor_records)
    failed_records = []
    saved_records  = []
    investor_records.each do |investor_record|
      investor = Investor.new(
                  first_name: investor_record[:first_name], last_name: investor_record[:last_name], email: investor_record[:email],
                  phone_number: investor_record[:phone_number], website: investor_record[:website], country: investor_record[:country],
                  state: investor_record[:state], syndicate_group: investor_record[:syndicate_group], group_name: investor_record[:group_name],
                  organization_name: investor_record[:organization_name], investment_rates: investor_record[:investment_rates],
                  founder_type: investor_record[:founder_type], about_us: investor_record[:about_us], investment_stages: investor_record[:investment_stages],
                  last_investment_stages: investor_record[:last_investment_stages].try(:split, ','), investment_category: investor_record[:investment_category].try(:split, ','),
                  investment_industry: investor_record[:investment_industry].try(:split, ','), emerging_technologies: investor_record[:emerging_technologies].try(:split, ','),
                  previous_emerging_technologies: investor_record[:previous_emerging_technologies].try(:split, ','), startup_selected: investor_record[:startup_selected].try(:split, ',')
                )
      if investor.save
        saved_records << { row_number: investor_record[:row_number], success: true, message: "Saved Successfuly" }
      else
        failed_records << { row_number: investor_record[:row_number], success: false, message: investor.errors.full_messages }
      end
    end
    return saved_records, failed_records
  end

  def save_bulk_startups(startup_records)
    failed_records = []
    saved_records  = []
    startup_records.each do |startup_record|
      startup = Startup.new(
                  first_name: startup_record[:first_name], last_name: startup_record[:last_name], email: startup_record[:email],
                  phone_number: startup_record[:phone_number], company_name: startup_record[:company_name], website: startup_record[:website],
                  country: startup_record[:country], state: startup_record[:state], part_of_accelerator: startup_record[:part_of_accelerator],
                  accelarator_name: startup_record[:accelarator_name], investment_rates: startup_record[:investment_rates], 
                  previous_investment_rates: startup_record[:previous_investment_rates], value_preposition: startup_record[:value_preposition],
                  competitors: startup_record[:competitors], additional_comments: startup_record[:additional_comments], about_us: startup_record[:about_us],
                  investor_type: startup_record[:investor_type], investment_stages: startup_record[:investment_stages].try(:split, ','), last_investment_stages: startup_record[:last_investment_stages].try(:split, ','),
                  investment_category: startup_record[:investment_category].try(:split, ','), investment_industry: startup_record[:investment_industry].try(:split, ','),
                  emerging_technologies: startup_record[:emerging_technologies].try(:split, ','), previous_emerging_technologies: startup_record[:previous_emerging_technologies].try(:split, ','),
                  investor_selected: startup_record[:investor_selected].try(:split, ',')
                )
      if startup.save
        saved_records << { row_number: startup_record[:row_number], success: true, message: "Saved Successfuly" }
      else
        failed_records << { row_number: startup_record[:row_number], success: false, message: startup.errors.full_messages }
      end
    end
    return saved_records, failed_records
  end
end
