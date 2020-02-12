class UsersController < ApplicationController
    
    # before_action :authenticate_user!

    # user_signed_in?

    # current_user

    # user_session

   #  def is_signed_in?
   #      if !user_signed_in?
   #         redirect_to new_user_session_path
   #      else 
   #         redirect_to "post#index"
   #      end
   #   end
   def create
    @user = User.new(params[:user])
 
    respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome email after save
        UserMailer.with(user: @user).welcome_email.deliver_now
 
        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end
