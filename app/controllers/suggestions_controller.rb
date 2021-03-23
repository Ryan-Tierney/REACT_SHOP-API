class SuggestionsController < ApplicationController

    def index 
        suggestions = Suggestion.all
        render json: suggestions, include: [:user]
    end 

    def create 
        suggestion = Suggestion.new(user_id: params[:user_id], text: params[:suggestion])
        if suggestion.save 
            render json: suggestion, include: [:user]
        else 
            render json: suggestion.errors.full_messages
        end 
    end 

    def destroy 
        suggestion = Suggestion.find(params[:id])
        suggestion.delete
        render json: {suggestionId: suggestion.id}
    end 
end
