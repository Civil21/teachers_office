class LessonWorksController < ApplicationController
  def update
    lesson_work.update(lesson_work_params)
    respond_to do |format|
      format.turbo_stream
      format.html {return }
    end
  end

  private

  def lesson_work
    @lesson_work ||= LessonWork.find(params[:id])
  end

  def lesson_work_params
    params.require(:lesson_work).permit(:score,:present,:comment)
  end
end
