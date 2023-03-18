require 'rails_helper'

RSpec.describe "Api::V1::LearningPaths", type: :request do
  describe "GET /index" do
    it 'returns learning path included by courses' do
      create_list(:learning_path, 2) do |path|
        create_list(:course, 5, :with_learning_path, learning_path: path)
      end
      get '/api/v1/learning_paths'
      expect(response).to have_http_status(200)
      expect(json_body['data'].count).to eq 2
      expect(json_body['data'][0]['attributes']['courses']['data'].count).to eq 5
    end
  end

  describe 'POST /create' do
    it 'create learning path with courses' do
      courses = create_list(:course, 3)
      post '/api/v1/learning_paths', params: {learning_path: {name: 'Test', courses: courses.map(&:id)}}
      expect(response).to have_http_status(204)
      expect(LearningPath.last.courses.count).to eq(3)
      expect(LearningPath.last.course_ids).to eq(courses.map(&:id))
    end

    it 'returns 422 if course is empty' do
      post '/api/v1/learning_paths', params: {learning_path: {name: 'Test', courses: []}}
      expect(response).to have_http_status(422)
    end
  end

  describe 'DELETE ' do
    it "delete a learning path and nullify all courses" do
      path = create(:learning_path)
      course = create(:course, :with_learning_path, learning_path: path)

      delete "/api/v1/learning_paths/#{path.id}"
      expect(response).to have_http_status(204)
      expect {path.reload}.to raise_error(ActiveRecord::RecordNotFound)
      expect(course.reload.order_in_learning_path).to be nil
      expect(course.learning_path_id).to be nil
    end
  end
end
