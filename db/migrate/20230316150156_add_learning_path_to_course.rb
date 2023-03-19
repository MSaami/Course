# frozen_string_literal: true

class AddLearningPathToCourse < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :order_in_learning_path, :integer, null: true
    add_reference :courses, :learning_path, foreign_key: true
  end
end
