class Lesson < ApplicationRecord
  belongs_to :subject
  belongs_to :group
  belongs_to :user, optional: true
  has_one :homework
end
