class HomeworksController < ApplicationController
  def index
    @groups = Group.all
    @group = Group.find_by(id: params[:group_id]) || @groups.first
    @students = @group.students
    @subjects = Subject.all
    @subject = Group.find_by(id: params[:subject_id]) || @subjects.first
    @lessons = Lesson.where(group: @group, subject: @subject)
    # @works = Work.where(group: @group, subject: @subject).group(:student)
  end
end
