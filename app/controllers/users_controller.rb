class UsersController < ApplicationController

    def index
        @users = User.all
    end


    def new
        # want to have an empty user
        @user = User.new

    end

    def create

        # take params from the form 
        

        # create a new user
        @user = User.new(form_params)

        # if its valid and it saves, go to the list users page

        # if not, see the form with errors
        if @user.save
            redirect_to users_path
        else
            render "new"
        end


    end

    def form_params
        # helps with security problems and hackers
        params.require(:user).permit(:username, :email, :password, :password_confirmation)


    end

end
