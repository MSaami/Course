require 'rails_helper'

RSpec.describe CourseCompletor do
  describe '.call' do
    it 'completes the course and specify next course for talent' do
      enroll = create(:learning_path_enrollment)
      described_class.new(talent_id: enroll.talent_id, course_id: enroll.next_course_id)
        .call

      expect(enroll.reload.next_course_id).to eq(enroll.learning_path.courses[1].id)
    end

    it 'sets next course is nil if it was the last course' do
      enroll = create(:learning_path_enrollment)
      enroll.update(next_course_id: enroll.learning_path.courses.last.id)
      described_class.new(talent_id: enroll.talent_id, course_id: enroll.next_course_id)
        .call
      expect(enroll.reload.next_course_id).to be nil
    end
  end
end
