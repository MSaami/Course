class Course < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :name, presence: true
  validates :author, presence: true
end
