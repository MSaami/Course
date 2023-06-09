# frozen_string_literal: true

class User < ApplicationRecord
  has_and_belongs_to_many :course_enrollments, foreign_key: "talent_id", join_table: "talents_courses",
                                               class_name: "Course"
  has_many :courses, foreign_key: "author_id"

  has_many :learning_path_enrollments, foreign_key: "talent_id"
  has_many :learning_paths, through: :learning_path_enrollments

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def next_course_for(learning_path_id)
    learning_path_enrollments.find_by(learning_path_id: learning_path_id)&.next_course
  end
end
