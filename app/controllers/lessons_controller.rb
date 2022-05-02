class LessonsController < ApplicationController
  before_action :authenticate_user!
  def index
    @day = Date.current
    @lessons = current_user.lessons.where(event_at: @day)
  end
end
