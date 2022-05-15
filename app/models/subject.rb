class Subject < ApplicationRecord
  has_many :homeworks
  has_many :subjects
end
