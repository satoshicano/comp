class FoodRecipesController < ApplicationController
  before_action :set_food_recipe, only: [:show, :update, :destroy]

  # GET /food_recipes
  def index
    @food_recipes = FoodRecipe.all

    render json: @food_recipes
  end

  # GET /food_recipes/1
  def show
    render json: @food_recipe
  end

  # POST /food_recipes
  def create
    @food_recipe = FoodRecipe.new(food_recipe_params)

    if @food_recipe.save
      render json: @food_recipe, status: :created, location: @food_recipe
    else
      render json: @food_recipe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /food_recipes/1
  def update
    if @food_recipe.update(food_recipe_params)
      render json: @food_recipe
    else
      render json: @food_recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /food_recipes/1
  def destroy
    @food_recipe.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_recipe
      @food_recipe = FoodRecipe.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def food_recipe_params
      params.fetch(:food_recipe, {})
    end
end
