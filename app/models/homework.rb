class Homework < ApplicationRecord
  belongs_to :group
  belongs_to :subject
  belongs_to :lesson

  has_one_attached :file
end
