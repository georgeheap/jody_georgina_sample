class CustomersController < ApplicationController
  def index
    @customer = current_customer
    @profile = @customer.profile || current_customer.build_profile
    render 'profiles/show'
  end
end
