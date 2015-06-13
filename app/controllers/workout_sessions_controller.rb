class WorkoutSessionsController < ApplicationController
  def create
    if workout_session.valid?
      redirect_to workout_workout_sessions_path(workout, params.slice(:workout_session))
    else
      render :new
    end
  end

  private

  def workout
    @workout ||= Workout.find(params[:workout_id])
  end
  helper_method :workout

  def workout_session
    @workout_session ||= WorkoutSession.new(params[:workout_session])
  end
  helper_method :workout_session

end
