class Student < ApplicationRecord
  belongs_to :group
  has_many :lesson_works
end
