require 'rails_helper'

RSpec.describe "Api::V1::Courses", type: :request do
  describe "GET /index" do
    it 'returns all of the courses' do
      courses = create_list(:course, 10)
      get '/api/v1/courses'
      expect(json_body['data'].count).to eq(10)
    end
  end

  describe "POST /courses" do
    it "creates the course" do
      course_params = build(:course).attributes
      post '/api/v1/courses', params: {course: course_params}
      expect(response).to have_http_status(204)
      expect(Course.last.name).to eq course_params['name']
    end
  end
end
