require 'rails_helper'

RSpec.describe LearningPathManager do
  describe 'call' do
    it "create a learning path with courses" do
      courses = create_list(:course, 4)
      params = {name: 'Test', courses: courses.map(&:id)}
      described_class.new(**params).call
      expect(LearningPath.last.courses.count).to eq 4
    end

    it 'raise exception if coures is empty' do
      expect { described_class.new(**{name: 'Test', courses: []}).call }.to raise_error(described_class::CourseIsEmptyException)
    end
  end
end
