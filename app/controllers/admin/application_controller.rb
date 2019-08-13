# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    # before_action :authenticate_user!
    # before_action :authenticate_admin
    # http_basic_authenticate_with name: "Jack", password: "password"
    # http_basic_authenticate_with(email: ENV.fetch("ADMIN_EMAIL"),password: ENV.fetch("ADMIN_PASSWORD"))

    # def authenticate_admin
    #   redirect_to '/', alert: 'Not authorized.' unless current_user && access_whitelist
    # end
  
    # private
    #   def access_whitelist
    #     current_user.try(:admin?) || current_user.try(:door_super?)
    #   end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end