require 'rails_helper'

RSpec.describe "Api::V1::Authors", type: :request do
  describe 'DELETE delete author' do
    it 'delete author and replace course' do
      author = create(:user)
      courses = create_list(:course, 2, author: author)
      new_author = create(:user)

      delete "/api/v1/authors/#{author.id}/replacement/#{new_author.id}"
      expect(response).to have_http_status(204)
      expect(new_author.courses.count).to eq(2)
    end
  end
end
