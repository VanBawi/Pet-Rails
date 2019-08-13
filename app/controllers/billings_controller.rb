class BillingsController < ApplicationController

#     before_action :authenticate_user!
    
#     # var stripe = Stripe('pk_test_lRvozy2evAGW3hLzbhpht3Dy00SSr8YXjC');
#     Stripe.api_key = Rails.application.credentials.stripe[:secret_key]
   

#     session = Stripe::Checkout::Session.create(
#     payment_method_types: ['card'],
#     subscription_data: {
#             items: [{
#             plan: 'plan_123',
#             }],
#         },
#     success_url: 'https://example.com/success',
#     cancel_url: 'https://example.com/cancel',
#     )

#     def index
#      @user=current_user.email
#     end

# # //////////////////////////////////

#     def new
#     end
    
#     def create
#       # Amount in cents
#       @amount = 500
    
#       customer = Stripe::Customer.create({
#         email: params[:stripeEmail],
#         source: params[:stripeToken],
#       })
    
#       charge = Stripe::Charge.create({
#         customer: customer.id,
#         amount: @amount,
#         description: 'Rails Stripe customer',
#         currency: 'usd',
#       })
    
#     rescue Stripe::CardError => e
#       flash[:error] = e.message
#       redirect_to new_charge_path
#     end


 end
