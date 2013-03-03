class PaymentsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    if current_user.status == 'paid'
      redirect_to '/dashboard'
    end
  end
  
  def create
    @payment = Payment.new(params[:payment])
    @payment.user_id = current_user.id
    @payment.email = current_user.email
    @payment.save

    redirect_to '/dashboard', :notice => "Your account has been upgraded!"
  end
end
