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
      :investory_type,
      :value_preposition,
      :competitors,
      :additional_comments,
      :about_us,
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

  private

  def unprocessable_entity(errors)
    render json: { errors: errors }, status: :unprocessable_entity
  end
end
