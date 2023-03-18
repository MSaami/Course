class LearningPathEnrollmentManager
  def initialize(talent_id:, learning_path_id:)
    @talent_id = talent_id
    @learning_path_id = learning_path_id
  end

  def call
    LearningPathEnrollment.create!(
      talent_id: @talent_id,
      learning_path_id: @learning_path_id,
      next_course_id: get_first_course.id
    )
  end

  private
  def get_first_course
    learning_path = LearningPath.find(@learning_path_id)
    learning_path.courses.first
  end
end
