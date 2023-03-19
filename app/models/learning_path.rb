class LearningPath < ApplicationRecord
  has_many :courses, -> {order(order_in_learning_path: :asc)}
  has_many :learning_path_enrollments
  has_many :talents, through: :learning_path_enrollments

  validates :name, presence: true

  before_destroy do
    courses.update_all(order_in_learning_path: nil, learning_path_id: nil)
  end

  def next_course_of(course_id)
    next_index = courses.find_index(Course.find(course_id)) + 1
    courses[next_index]
  end


end
