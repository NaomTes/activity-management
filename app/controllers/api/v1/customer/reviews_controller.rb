class Api::V1::Customer::ReviewsController < Api::V1::Customer::ApiController
  before_action :authenticate

  def create
    @review = Review.new(set_review_params)
    if @review.save
      render json: Customer::ReviewSerializer.new(@review).serialized_json,
             status: :created
    else
      unprocessable_entity @review.errors
    end
  end

  private

  def set_review_params
    params.require(:review).permit(
      :booked_service_id,
      :comments,
      :ratings
    )
  end
end
