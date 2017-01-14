class FoodStepRecipesController < ApplicationController
  before_action :set_food_step_recipe, only: [:show, :update, :destroy]

  # GET /food_step_recipes
  def index
    @food_step_recipes = FoodStepRecipe.all

    render json: @food_step_recipes
  end

  # GET /food_step_recipes/1
  def show
    render json: @food_step_recipe
  end

  # POST /food_step_recipes
  def create
    @food_step_recipe = FoodStepRecipe.new(food_step_recipe_params)

    if @food_step_recipe.save
      render json: @food_step_recipe, status: :created, location: @food_step_recipe
    else
      render json: @food_step_recipe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /food_step_recipes/1
  def update
    if @food_step_recipe.update(food_step_recipe_params)
      render json: @food_step_recipe
    else
      render json: @food_step_recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /food_step_recipes/1
  def destroy
    @food_step_recipe.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_step_recipe
      @food_step_recipe = FoodStepRecipe.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def food_step_recipe_params
      params.require(:food_step_recipe).permit(:food_step_id, :recipi_id)
    end
end
