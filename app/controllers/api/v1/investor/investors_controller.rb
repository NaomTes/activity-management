class Api::V1::Investor::InvestorsController < ActionController::API
  include ActionView::Helpers::NumberHelper

  def create
    investor_params = params.require(:investors).permit(
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
    )
    @investor = Investor.new(
      investor_params
    )
    if @investor.save
      render json: { investor: @investor }
    else
      unprocessable_entity @investor.errors
    end
  end

  def process_results
    startup_data = params.require(:startup).permit(
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
    ).to_h

    ratings_data = params.require(:ratings).permit(
      :investment_stages,
      :investment_category,
      :emerging_technologies,
      :investment_rates,
    ).to_h

    individual_score = 1
    total_score = 0

    ratings_data.each do |key, value|
      total_score += (individual_score * value)
    end

    results = []
    Investor.all.each do |investor|
      investor_score = 0
      ratings_data.each do |key, value|
        investor_meta_data = eval("investor.#{key}")
        startup_meta_data = eval("startup_data[:#{key}]")

        if investor_meta_data.class == Array
          if startup_meta_data.count > 0
            investor_score += (((investor_meta_data & startup_meta_data).count.to_f / startup_meta_data.count) * (individual_score * value))
          end
        else
          if startup_meta_data == investor_meta_data
            investor_score += (individual_score * value)
          end
        end
      end
      results << { :id => investor.id, :email => investor.email, :phone_number => investor.phone_number, :investor_name => investor.first_name + " " + investor.last_name, :match_score => number_with_precision((investor_score / total_score) * 100, precision: 2) }
    end
    render json: { results: results.sort! { |a, b| a[:match_score] <=> b[:match_score] }.reverse  }
  end

  private

  def unprocessable_entity(errors)
    render json: { errors: errors }, status: :unprocessable_entity
  end
end
