# frozen_string_literal: true

class CourseCompletor
  class UserNotAssignedToThisCourseException < StandardError; end

  def initialize(talent_id:, course_id:)
    @talent_id = talent_id
    @course_id = course_id
  end

  def call
    enrollment = user_enrollment
    raise UserNotAssignedToThisCourseException if enrollment.nil?

    change_next_course(enrollment)
  end

  private

  def user_enrollment
    LearningPathEnrollment.where(talent_id: @talent_id, next_course_id: @course_id).first
  end

  def change_next_course(enrollment)
    enrollment.update!(
      next_course_id: enrollment.learning_path.next_course_of(enrollment.next_course_id)&.id
    )
  end
end
