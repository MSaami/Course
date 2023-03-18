class LearningPathManager
  class CourseIsEmptyException < StandardError; end

  def initialize(name:, courses:)
    @name = name
    @courses = courses
  end

  def call
    raise CourseIsEmptyException if @courses.compact_blank!.blank?
    learning_path = LearningPath.find_or_initialize_by(name: @name)
    learning_path.save!
    course_data = make_course_data(learning_path.id)
    Course.update(course_data.keys, course_data.values)
  end

  private
  def make_course_data(learning_path_id)
    data = {}
    @courses.each_with_index do |id, index|
      data[id] = {order_in_learning_path: index, learning_path_id: learning_path_id}
    end
    data
  end

end
