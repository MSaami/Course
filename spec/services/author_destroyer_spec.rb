require 'rails_helper'

RSpec.describe AuthorDestroyer do
  describe '.call' do
    it 'removes the author and replace all courses' do
      author = create(:user)
      new_author = create(:user)
      courses = create_list(:course, 2, author: author)

      described_class.new(author_id: author.id, replacment_id: new_author.id)
        .call

      expect(new_author.courses.count).to eq(2)
    end
  end
end

