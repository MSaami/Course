class User < ApplicationRecord
  has_and_belongs_to_many :courses, foreign_key: 'talent_id', join_table: 'talents_courses'

  has_many :learning_path_enrollments, foreign_key: 'talent_id'
  has_many :learning_paths, through: :learning_path_enrollments

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
