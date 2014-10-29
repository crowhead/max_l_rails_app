class StepsController < ApplicationController
    before_action :find_step, only: [:show, :edit, :update, :destroy]

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    if @step.save
      @activity << @step
      redirect_to new_step_path(@activity)
    else
      redirect_to new_step_path
    end
  end

  def edit

  end

  def destroy
    Step.destroy(params[:id])
    redirect_to Steps_path
  end

  def update

  end

  private
    def find_step
      @step = Step.find(params[:id])
    end

    def step_params
      params.require(:step).permit(:body)
    end

end
