class Api::V1::Investor::InvestorsController < ActionController::API
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

  private
    def unprocessable_entity(errors)
      render json: { errors: errors }, status: :unprocessable_entity
    end
end
