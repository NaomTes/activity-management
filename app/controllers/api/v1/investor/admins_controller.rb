class Api::V1::Investor::AdminsController < ApplicationController

  def bulk_upload_data
    results = current_user.bulk_upload_data(upload_records_params[:data])
    render json: { results: results }
  end

  private

  def upload_records_params
    params.permit(
      data: [
        :row_number,
        :type,
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
        :syndicate_group,
        :group_name,
        :organization_name,
        :investment_rates,
        :previous_investment_rates,
        :value_preposition,
        :competitors,
        :additional_comments,
        :founder_type,
        :about_us,
        :investor_type,
        :investment_stages,
        :last_investment_stages,
        :investment_category,
        :investment_industry,
        :emerging_technologies,
        :previous_emerging_technologies,
        :startup_selected,
        :investor_selected
      ]
    )
  end
end
