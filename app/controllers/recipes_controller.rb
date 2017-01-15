class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  # GET /recipes
  def index
    @recipes = Recipe.all.map do |r|
      foods = r.foods.map do |f|
        {
          id: f.id,
          title: f.name,
          option: f.option,
          leather: f.leather,
          price: f.cost,
          num: FoodRecipe.includes(:recipe).find_by({food_id: f.id, recipe_id: r.id }).number,
          nutrients: {
            calorie: f.calorie,
            ash: f.ash,
            cholesterol: f.cholesterol,
            protein: f.protein,
            water: f.water,
            fiber: f.fiber,
            carb: f.carb
          }
        }
      end

      steps = r.food_steps.joins(:step, :food).includes(:step, :food).group_by {|fs| fs.step.name}.map do |name, fss| {
        title: name, foods: fss.map{|fs| fs.food.name}, time: fss.first.step.time }
      end
      {title: r.title, servings: r.servings, foods: foods, steps: steps}
    end

    render json: @recipes
  end

  # GET /recipes/1
  # {“title”: “さとしのカレー”, “servings”: 2, ”foods”: [{ {“name”:”じゃがいも”, “nutrients”: {...}} , “num”:1 } ],
  #  “steps”: [{ "order": 1,  “foods”: [1,2,3], “step_id”: 1}, {"order": 2, “foods”: [1,2,3], “step_id”: 2}] }

  def show
    foods = @recipe.foods.map do |f|
      {
        id: f.id,
        title: f.name,
        option: f.option,
        leather: f.leather,
        price: f.cost,
        num: FoodRecipe.includes(:recipe).find_by({food_id: f.id, recipe_id: @recipe.id }).number,
        nutrients: {
          calorie: f.calorie,
          ash: f.ash,
          cholesterol: f.cholesterol,
          protein: f.protein,
          water: f.water,
          fiber: f.fiber,
          carb: f.carb
        }
      }
    end

    steps = @recipe.food_steps.joins(:step, :food).includes(:step, :food).group_by {|fs| fs.step.name}.map do |name, fss| {
      title: name, foods: fss.map{|fs| fs.food.name}, time: fss.first.step.time }
    end

    render json: {title: @recipe.title, servings: @recipe.servings, foods: foods, steps: steps}
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      render json: @recipe, status: :created, location: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params)
      render json: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_params
      params.require(:recipe).permit(:title, :servings)
    end
end
