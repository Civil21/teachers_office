class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
  end

  def profile
    @user = current_user
  end

  def schedule
    date =  ((Date.parse(params[:date]) if params[:date] )|| Date.current).beginning_of_week
    @beginning_of_week = date
    @prev_week =  @beginning_of_week-1.day
    @end_of_week = date.end_of_week
    @next_week = @end_of_week+1.day
    @lessons = current_user.lessons.where("event_at > ? AND event_at < ?",@beginning_of_week, @end_of_week)
    @day = date
  end
end
