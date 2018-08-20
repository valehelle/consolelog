class UserController < ApplicationController
    def landing
    
    end
    def login
        @user = User.new
    end
    def create
        if User.exists?(email: params[:user][:email])
            user = User.find_by(email: params[:user][:email])
            if user.valid_password?(params[:user][:password])
                sign_in(user, scope: :user)
                redirect_to projects_path
            else
                puts 'password incorrect'
            end
        else
            puts 'User does not exists'
        end

     
    end

    private
    def user_params 
        params.require(:user).permit(:email,:password)
    end
end
