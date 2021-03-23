class SessionsController < ApplicationController
    def create 
        user = User.find_by(email: params[:email, password])

        if user 
            session[:user_id] = user.user_id
            render json: user, only: [:email, password, :id]
        else 
            render json: { message: 'User not found' }
        end 
    end 

    def destroy
        if session[:user_id]
            reset_session
        end 
    end 
end
