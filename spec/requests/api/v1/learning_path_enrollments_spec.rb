# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::LearningPathEnrollments", type: :request do
  describe "POST /create" do
    it "enrolls a user into learning path" do
      user = create(:user)
      learning_path = create(:learning_path)

      post "/api/v1/learning_paths/#{learning_path.id}/learning_path_enrollments",
           params: { user: { id: user.id } }

      expect(response).to have_http_status(204)
      expect(LearningPathEnrollment.last.talent_id).to eq(user.id)
      expect(LearningPathEnrollment.last.learning_path_id).to eq(learning_path.id)
      expect(LearningPathEnrollment.last.next_course_id).to eq(learning_path.courses.first.id)
    end

    it "return 422 if duplicate enrolls wants to store" do
      enroll = create(:learning_path_enrollment)

      post "/api/v1/learning_paths/#{enroll.learning_path_id}/learning_path_enrollments",
           params: { user: { id: enroll.talent_id } }

      expect(response).to have_http_status(422)
    end
  end
end
