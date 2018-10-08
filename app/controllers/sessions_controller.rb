class SessionsController < ApplicationController


    def new
        # login form creation
        
    end

    def create
        # try to log in
        @form_data = params.require(:session)

        # pull out username and password
        @username = @form_data[:username]
        @password = @form_data[:password]

        # authenticate
        @user = User.find_by(username: @username).try(:authenticate, @password)


        # if user is present, redirect to homepage
        if @user
            # save the user to that user's session
            session[:user_id] = @user.id



            redirect_to root_path

        else
            render "new"

        end

    end

    def destroy
        # log out

        # remove the session completely
        # anything attached to session is completely restarted
        reset_session

        # redirect to log in page
        redirect_to new_session_path
    end


end
