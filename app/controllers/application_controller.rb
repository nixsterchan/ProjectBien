class ApplicationController < ActionController::Base
    # The boss controller


    # Before any page loads, find the current user
    before_action :find_current_user

    # add in method to use in views, basically sharing code amongst views on controller
    helper_method :is_logged_in?
    
    def find_current_user
        if is_logged_in?
            @current_user = User.find(session[:user_id])
        else
            @current_user = nil
        end

    end

    # check the status for login
    def check_login
        unless is_logged_in?
            redirect_to new_session_path
        end
        #     # all is cool
        # else
        #     redirect_to new_session_path
        # end
    end

    # is the user logged in 
    def is_logged_in?
        session[:user_id].present?
    end


end
