class LessonWork < ApplicationRecord
  belongs_to :student
  belongs_to :lesson
  enum present: {
    yes: 0,
    past: 1,
    no: 2
  }
end
