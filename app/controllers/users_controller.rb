class UsersController < ApplicationController
    def index 
        users = User.all 
        render json: users, only: [:id, :email, :password]
    end 

    def show 
        user = User.find(params[:id])
        render json: user, only: [:id, :email, password]
    end 

    def create 
        user = User.new(user_params)
        if user.save
            session[:user_id] = user_id
            render json: user, only: [:id, :email, :password]
        else 
            render json: user.errors.full_messages
        end 
    end 

    private 
    
    def user_params
        params.require(:user).permit(:email, password)
    end 
end
