class FoodStepsController < ApplicationController
  before_action :set_food_step, only: [:show, :update, :destroy]

  # GET /food_steps
  def index
    @food_steps = FoodStep.all

    render json: @food_steps
  end

  # GET /food_steps/1
  def show
    render json: @food_step
  end

  # POST /food_steps
  def create
    @food_step = FoodStep.new(food_step_params)

    if @food_step.save
      render json: @food_step, status: :created, location: @food_step
    else
      render json: @food_step.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /food_steps/1
  def update
    if @food_step.update(food_step_params)
      render json: @food_step
    else
      render json: @food_step.errors, status: :unprocessable_entity
    end
  end

  # DELETE /food_steps/1
  def destroy
    @food_step.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_step
      @food_step = FoodStep.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def food_step_params
      params.fetch(:food_step, {})
    end
end
