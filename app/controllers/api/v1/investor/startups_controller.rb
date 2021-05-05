class Api::V1::Investor::StartupsController < ActionController::API
  load_and_authorize_resource

  include ActionView::Helpers::NumberHelper

  def create
    if @startup.save
      render json: { startup: @startup }
    else
      unprocessable_entity @startup.errors
    end
  end

  def process_results
    investor_data = process_investor_params.to_h
    ratings_data  = ratings_params.to_h

    Investor.save_current_record(investor_data)

    individual_score = 1
    total_score      = 0

    ratings_data.each do |key, value|
      total_score += (individual_score * value)
    end

    results = []
    Startup.all.each do |startup|
      startup_score = 0
      ratings_data.each do |key, value|

        startup_meta_data  = eval("startup.#{key}")
        investor_meta_data = eval("investor_data[:#{key}]")

        if startup_meta_data.class == Array
          if investor_meta_data.count > 0
            startup_score += (((startup_meta_data & investor_meta_data).count.to_f / investor_meta_data.count) * (individual_score * value))
          end
        
        else
          if investor_meta_data == startup_meta_data
            startup_score       += (individual_score * value)
          end
        end
      end
      results << { :id => startup.id, :investor_type => startup.investor_type, :value_preposition => startup.value_preposition, :website => startup.website, :email => startup.email, :phone_number => startup.phone_number, :company_name => startup.company_name, :match_score => ((startup_score / total_score) * 100).to_i }
    end

    render json: { results: results.sort_by{ |item| item[:match_score] }.reverse }
  end

  private

  def process_investor_params
    params[:investor][:investment_industry]   = merger_other_params(investor_params[:investment_industry], investor_params[:investment_industry_other])
    params[:investor][:investment_category]   = merger_other_params(investor_params[:investment_category], investor_params[:investment_category_other])
    params[:investor][:emerging_technologies] = merger_other_params(investor_params[:emerging_technologies], investor_params[:emerging_technology_other])
    params[:investor][:previous_emerging_technologies] = merger_other_params(investor_params[:previous_emerging_technologies], investor_params[:previous_emerging_technology_other])
    investor_params
  end

  def merger_other_params(items, other_items)
    if other_items.present?
      other_items = other_items.split(',')
      items.delete('others')
      other_items.map(&:strip!)
      items += other_items
    end
    items
  end

  def startup_params
    params.require(:startup).permit(
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
      :founders_information,
      :value_preposition,
      :competitors,
      :additional_comments,
      :about_us,
      :investor_type,
      :investment_category_other,
      :previous_emerging_technology_other,
      :emerging_technology_other,
      :investment_industry_other,
      investment_stages: [],
      last_investment_stages: [],
      investment_category: [],
      investment_industry: [],
      emerging_technologies: [],
      previous_emerging_technologies: [],
      investor_selected: []
    )
  end

  def investor_params
    params.require(:investor).permit(
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
      :investment_industry_other,
      :investment_category_other,
      :emerging_technology_other,
      :previous_emerging_technology_other,
      investment_stages: [],
      last_investment_stages: [],
      investment_category: [],
      investment_industry: [],
      emerging_technologies: [],
      previous_emerging_technologies: [],
      startup_selected: []
    )
  end

  def ratings_params
    params.require(:ratings).permit(
      :investment_stages,
      :investment_category,
      :emerging_technologies,
      :investment_rates,
      :investment_industry,
      :previous_emerging_technologies,
      :last_investment_stages,
      :country,
      :state,
    )
  end

  def unprocessable_entity(errors)
    render json: { errors: errors }, status: :unprocessable_entity
  end
end
