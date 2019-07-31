class UsersController < ApplicationController


    before_action :authenticate_user!

    user_signed_in?

    current_user

    user_session

    def is_signed_in?
        if !user_signed_in?
           redirect_to new_user_session_path
        else 
           redirect_to root_path
        end
     end

end
