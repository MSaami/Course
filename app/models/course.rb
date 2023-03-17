class Course < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :learning_path, optional: true

  validates :name, presence: true
  validates :author, presence: true
  validates :order_in_learning_path, presence: true, if: -> {learning_path.present?}
  validates :order_in_learning_path, absence: true, unless: -> {learning_path.present?}
  validates :learning_path, presence: true, if: -> {learning_path_id.present?}
end
