class RecipesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :invalid
    # before_action :logged_in
    # skip_before_action :logged_in, only: [:create]

    def index
        render json: Recipe.all
    end


    def create
            recipe = @current_user.recipes.create!(recipe_params)
            render json: recipe, status: :created
    end

    

    private


    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete,:user_id)
    end

end