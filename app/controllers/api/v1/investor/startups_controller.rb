class Api::V1::Investor::StartupsController < ActionController::API
  def create
    startup_params = params.require(:startups).permit(
      :first_name,
      :last_name,
      :email,
      :phone_number,
      :company_name,
      :website,
      :country,
      :state,
      :part_of_accelerator,
      :accelarator_name,
      :investment_rates,
      :previous_investment_rates,
      :value_preposition,
      :competitors,
      :additional_comments,
      :about_us,
      :investor_type,
      investment_stages: [],
      last_investment_stages: [],
      investment_category: [],
      investment_industry: [],
      emerging_technologies: [],
      previous_emerging_technologies: [],
    )
    @startup = Startup.new(
      startup_params
    )
    if @startup.save
      render json: { startup: @startup }
    else
      unprocessable_entity @startup.errors
    end
  end

  def process_results
    investor_data = params.require(:investor).permit(
      :first_name,
      :last_name,
      :email,
      :phone_number,
      :website,
      :country,
      :state,
      :syndicate_group,
      :group_name,
      :organization_name,
      :investment_rates,
      :founder_type,
      :about_us,
      investment_stages: [],
      last_investment_stages: [],
      investment_category: [],
      investment_industry: [],
      emerging_technologies: [],
      previous_emerging_technologies: [],
    ).to_h

    ratings_data = params.require(:ratings).permit(
      :investment_stages,
      :investment_industry,
      :emerging_technologies,
      :investment_rates,
    ).to_h

    individual_score = 10
    total_score = ratings_data.count * individual_score

    Startup.all.each do |startup|
      startup_score = 0
      ratings_data.each do |key, value|

        startup_meta_data = eval("startup.#{key}")
        investor_meta_data = eval("investor_data[:#{key}]")

        weightage = (value * 2) / individual_score
        if startup_meta_data.class == Array
          if investor_meta_data.count > 0
            startup_score += (((startup_meta_data & investor_meta_data).count / investor_meta_data.count) * individual_score) * weightage
          end
        
        else
          if investor_meta_data == startup_meta_data
            startup_score += (individual_score * weightage)
          end
        end
      end 
    end
  end

  private

  def unprocessable_entity(errors)
    render json: { errors: errors }, status: :unprocessable_entity
  end
end
