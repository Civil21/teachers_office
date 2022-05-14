class HomeworksController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.all
    @group = Group.find_by(id: params[:group_id]) || @groups.first
    @students = @group.students
    @subjects = Subject.all
    @subject = Group.find_by(id: params[:subject_id]) || @subjects.first
    @lessons = Lesson.where(group: @group, subject: @subject)
    # @works = Work.where(group: @group, subject: @subject).group(:student)
  end

  def create
    @homework = Homework.create(homework_params)
    respond_to do |format|
      format.turbo_stream
    end
  end

  def update
    homework.update(homework_params)
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def homework
    @homework ||= Homework.find(params[:id])
  end

  def homework_params
    params.require(:homework).permit(:lesson_id,:subject_id,:file,:group_id)
  end
end
