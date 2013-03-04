class PaymentsController < ApplicationController
  before_filter :authenticate_user!, :kick_out => [:except => :destroy]
  
  def new
  end
  
  def create
    @payment = Payment.new(params[:payment])
    @payment.user_id = current_user.id
    @payment.email = current_user.email
    @payment.save

    ActionMailer::Base.mail(
                            :from => "reply@rmapi.com",
                            :to => current_user.email,
                            :subject => "Thanks for creating an account! You now have full access to the API and will receive the most accurate information from the server. If you have any questions at all please reply to this email.",
                            :body => "You have upgraded your rmapi account!").deliver

    redirect_to '/dashboard', :notice => "Your account has been upgraded!"
  end
  
  def destroy
    Stripe.api_key = "sk_test_fVKfBEBDcWPZl5mLFk44KBJX"
    
    cu = Stripe::Customer.retrieve(current_user.stripe_customer_id)
    cu.delete
    
    User.update(current_user.id, :status => 'free', :stripe_customer_id => '')
    
    ActionMailer::Base.mail(
                            :from => "reply@rmapi.com",
                            :to => current_user.email,
                            :subject => "Feel free to reply to this email and tell us any problems, issues or concerns you may have!",
                            :body => "We're sorry to see you go :(").deliver
    
    redirect_to '/dashboard', :notice => "Your account has been downgraded and you will no longer be billed"
  end
  
  private
  
  def kick_out
    if current_user.status == 'paid'
      redirect_to '/dashboard'
    end
  end
end
