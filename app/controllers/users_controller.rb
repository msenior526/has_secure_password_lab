class UsersController < ApplicationController 

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
        else
            flash[:error] = "Incorrect info"
            redirect_to signup_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end