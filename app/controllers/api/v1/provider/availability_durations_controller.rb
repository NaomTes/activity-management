class Api::V1::Provider::AvailabilityDurationsController < Api::V1::Provider::ApiController
  before_action :authenticate

  def create
    @duration = current_provider.availability_durations.build(duration_params)
    if @duration.save
      CreateAvailability.new(@duration).call
      render json: Provider::AvailabilityDurationSerializer.new(@duration).serialized_json,
             status: :created
    else
      unprocessable_entity @duration.errors
    end
  end

  private

  def duration_params
    params.require(:availability_duration).permit(
      :starting_date,
      :from_time,
      :to_time,
      :repetition,
      repetition_days: [],
    )
  end
end
