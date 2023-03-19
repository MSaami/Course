# frozen_string_literal: true

class LearningPathEnrollment < ApplicationRecord
  belongs_to :talent, class_name: "User"
  belongs_to :learning_path
  belongs_to :next_course, class_name: "Course", optional: true

  validates :talent_id, uniqueness: { scope: :learning_path_id }
end
