class LearningPath < ApplicationRecord
  has_many :courses

  validates :name, presence: true

  before_destroy do
    courses.update_all(order_in_learning_path: nil, learning_path_id: nil)
  end


end
