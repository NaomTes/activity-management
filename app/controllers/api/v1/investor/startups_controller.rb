class Api::V1::Investor::StartupsController < ActionController::API
  include ActionView::Helpers::NumberHelper

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
      investor_selected: []
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
      startup_selected: []
    ).to_h

    ratings_data = params.require(:ratings).permit(
      :investment_stages,
      :investment_category,
      :emerging_technologies,
      :investment_rates,

      :investment_industry,
      :previous_emerging_technologies,

      :country,
      :state,
    ).to_h

    individual_score = 1
    total_score = 0

    ratings_data.each do |key, value|
      total_score += (individual_score * value)
    end

    results = []
    Startup.all.each do |startup|
      startup_score = 0
      ratings_data.each do |key, value|

        startup_meta_data = eval("startup.#{key}")
        investor_meta_data = eval("investor_data[:#{key}]")

        if startup_meta_data.class == Array
          if investor_meta_data.count > 0
            startup_score += (((startup_meta_data & investor_meta_data).count.to_f / investor_meta_data.count) * (individual_score * value))
          end
        
        else
          if investor_meta_data == startup_meta_data
            startup_score += (individual_score * value)
          end
        end
      end
      results << { :id => startup.id, :investor_type => startup.investor_type, :value_preposition => startup.value_preposition, :website => startup.website, :email => startup.email, :phone_number => startup.phone_number, :company_name => startup.company_name, :match_score => ((startup_score / total_score) * 100).to_i }
    end

    render json: { results: results.sort_by{ |item| item[:match_score] }.reverse }
  end

  private

  def unprocessable_entity(errors)
    render json: { errors: errors }, status: :unprocessable_entity
  end
end
