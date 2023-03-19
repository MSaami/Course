require 'rails_helper'

RSpec.describe "Api::V1::Talents", type: :request do
  describe 'POST assign_course' do
    it 'assign courses to user' do
      user = create(:user)
      courses = create_list(:course, 3)
      post "/api/v1/talents/#{user.id}/assign_course", params: {courses: {ids: courses.map(&:id)}}

      expect(response).to have_http_status(204)
      expect(user.courses.count).to eq 3
    end
  end

  describe 'POST complete the course' do
    it 'client can mark a course completed' do
      enroll = create(:learning_path_enrollment)

      post "/api/v1/talents/#{enroll.talent_id}/complete_course", params: {course: {id: enroll.next_course_id}}

      expect(response).to have_http_status(204)
      expect(enroll.reload.next_course_id).to eq(enroll.learning_path.courses[1].id) 
    end

    it 'return 422 if the user does not assigned to the course' do
      user = create(:user)
      post "/api/v1/talents/#{user.id}/complete_course", params: {course: {id: 12}}
      expect(response).to have_http_status(422)

    end
  end

end
