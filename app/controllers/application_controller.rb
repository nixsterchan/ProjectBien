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

    # check admin login status
    def check_admin
      @user = find_current_user

      unless @user.present? and @user.is_admin?
        redirect_to root_path
      end

    end

    # find admin user
    def find_admin_user
      @current_user = find_current_user

      if @current_user.present? and @current_user.is_admin?
        @current_user
      else
        nil
      end
    end

end
