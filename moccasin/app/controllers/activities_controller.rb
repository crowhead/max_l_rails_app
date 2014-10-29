class ActivitiesController < ApplicationController
   before_action :find_activity, only: [:show, :edit, :update, :destroy]


  def index
    @user_activities = current_user.activities
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      current_user.activities << @activity
      redirect_to activity_path @activity
    else
      redirect_to new_activity_path
    end
  end

  def edit

  end

  def update
  end

  def destroy
    Activity.destroy(params[:id])
    redirect_to activities_path
  end

  private
    def find_activity
      @activity = Activity.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:title, :author_name)
    end
end
