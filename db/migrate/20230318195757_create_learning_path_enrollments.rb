class CreateLearningPathEnrollments < ActiveRecord::Migration[6.1]
  def change
    create_table :learning_path_enrollments do |t|
      t.references :talent, null: false, foreign_key: {to_table: :users}
      t.references :learning_path, null: false, foreign_key: true
      t.references :next_course, null: false, foreign_key: {to_table: :courses}

      t.timestamps
    end
  end
end
