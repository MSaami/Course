class CreateTalentsCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :talents_courses do |t|
      t.references :course, null: false, foreign_key: true
      t.references :talent, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
