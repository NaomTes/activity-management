class Api::V1::Customer::ProfilesController < Api::V1::Customer::ApiController
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render json: Customer::CustomerSerializer.new(@customer).serialized_json,
             status: :created
    else
      unprocessable_entity @customer.errors
    end
  end

  private

  def customer_params
    params.require(:customer).permit(
      :email,
      :password,
      :password_confirmation,
      :first_name,
      :last_name,
      :age,
      :phone_number,
      :street,
      :city,
      :postal_code,
      :country
    )
  end
end
