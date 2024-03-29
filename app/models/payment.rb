class Payment < ActiveRecord::Base
  attr_accessible :card_number, :cvc, :card_expiration_month, :card_expiration_year, :stripe_token
  before_save :update_stripe
  attr_accessor :card_number, :cvc, :card_expiration_month, :card_expiration_year, :stripe_token
  #before_destroy :cancel_subscription
  
  #validates_presence_of :name
  #validates_presence_of :stripe_token

  def update_stripe
    Stripe.api_key = "sk_test_fVKfBEBDcWPZl5mLFk44KBJX"
    
    # create the charge on Stripe's servers - this will charge the user's card
    if customer = Stripe::Customer.create(
        :card => stripe_token,
        :plan => "basic_plan",
        :description => email
      )
      
      User.update(user_id, :status => 'paid', :stripe_customer_id => customer.id)
    end
  end
end
