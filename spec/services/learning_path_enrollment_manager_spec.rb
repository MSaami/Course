require 'rails_helper'

RSpec.describe LearningPathEnrollmentManager do

  describe 'call' do
    it 'enrolls talent to learning path' do
      user = create(:user)
      learning_path = create(:learning_path)
      described_class.new(learning_path_id: learning_path.id, talent_id: user.id).call
      first_course = learning_path.courses.first
      expect(LearningPathEnrollment.count).to eq(1)
      expect(LearningPathEnrollment.last.talent_id).to eq(user.id)
      expect(LearningPathEnrollment.last.learning_path_id).to eq(learning_path.id)
      expect(LearningPathEnrollment.last.next_course_id).to eq(first_course.id)
    end
  end


end
