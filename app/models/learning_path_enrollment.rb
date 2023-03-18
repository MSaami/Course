class LearningPathEnrollment < ApplicationRecord
  belongs_to :talent, class_name: 'User', foreign_key: 'talent_id'
  belongs_to :learning_path

  validates :talent_id, uniqueness: {scope: :learning_path_id}
end
