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

end
