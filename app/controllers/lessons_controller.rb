class LessonsController < ApplicationController
  before_action :authenticate_user!

  def index
    @day = Date.current
    @lessons = current_user.lessons.where(event_at: @day)
  end

  def update
    lesson.update(lesson_params)
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def lesson
    @lesson ||= Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:name)
  end
end
