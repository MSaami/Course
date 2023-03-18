require 'rails_helper'

RSpec.describe LearningPathEnrollment, type: :model do
  describe 'Validations' do
    subject { create(:learning_path_enrollment)}
    it { should validate_uniqueness_of(:talent_id).scoped_to(:learning_path_id) }
  end
end
