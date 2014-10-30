require 'pry'
class StepsController < ApplicationController
    before_action :find_step, only: [:show, :edit, :update, :destroy]

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    if @step.save
      redirect_to activity_path(@step.activity_id)
    else
      redirect_to new_step_path
    end
  end

  def edit
  end

  def destroy
    @step.destroy
    redirect_to steps_path
  end

  def update
    if @step.update_attributes(step_params)
      redirect_to :step => 'show', :id => @step
    else
      @steps = Step.find(:all)
      render :step => 'edit'
    end

  end

  private
    def find_step
      @step = Step.find(params[:id])
    end

    def step_params
      params.require(:step).permit(:body, :activity_id)
    end

end
