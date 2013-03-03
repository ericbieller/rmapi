class PaymentsController < ApplicationController
  before_filter :authenticate_user!, :kick_out => [:except => :destroy]
  
  def new
  end
  
  def create
    @payment = Payment.new(params[:payment])
    @payment.user_id = current_user.id
    @payment.email = current_user.email
    @payment.save

    redirect_to '/dashboard', :notice => "Your account has been upgraded!"
  end
  
  def destroy
    Stripe.api_key = "sk_test_fVKfBEBDcWPZl5mLFk44KBJX"
    
    cu = Stripe::Customer.retrieve(current_user.stripe_customer_id)
    cu.delete
    
    User.update(current_user.id, :status => 'free', :stripe_customer_id => '')
    
    redirect_to '/dashboard', :notice => "Your account has been downgraded and you will no longer be billed"
  end
  
  private
  
  def kick_out
    if current_user.status == 'paid'
      redirect_to '/dashboard'
    end
  end
end
