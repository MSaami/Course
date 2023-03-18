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

    it 'get validation response if data is incorrect' do
      course_params = attributes_for(:course)
      post '/api/v1/courses', params: {course: course_params}
      expect(response).to have_http_status(422)
    end
  end

  describe "GET /courses/:id" do
    it "returns course with id " do
      course = create(:course)
      get '/api/v1/courses/' + course.id.to_s
      expect(response).to have_http_status(200)
      expect(json_body['data']['attributes']['name']).to eq course.name
    end

    it "returns 404 if send invalid id" do
      get '/api/v1/courses/dummyId'
      expect(response).to have_http_status(404)
    end
  end

  describe "DELETE /courses/:id" do
    it 'destroy the course' do
      course = create(:course)
      delete "/api/v1/courses/#{course.id}"
      expect(response).to have_http_status(204)
      expect(Course.find_by_id(course.id)).to be nil
    end
  end

  describe "PUT /courses/:id" do
    it "updates course" do
      course = create(:course)
      user = create(:user)
      learning_path = create(:learning_path)
      params = {
        name: 'New Name',
        author_id: user.id,
        learning_path_id: learning_path.id,
        order_in_learning_path: 1
      }

      put "/api/v1/courses/#{course.id}", params: {course: params}

      expect(response).to have_http_status(204)
      course.reload
      expect(course.name).to eq('New Name')
      expect(course.author_id).to eq(user.id)
      expect(course.learning_path_id).to eq(learning_path.id)
      expect(course.order_in_learning_path).to eq(1)
    end
  end
end
