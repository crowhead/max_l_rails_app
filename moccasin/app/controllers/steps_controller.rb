class StepsController < ApplicationController

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    if @step.save
      current_user.steps << @step
      redirect_to step_path @step
    else
      redirect_to new_activity_path
    end
  end

  def edit

  end

  def destroy

  end

  def update

  end

end
