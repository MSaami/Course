# frozen_string_literal: true

require "rails_helper"

RSpec.describe LearningPath, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:name) }
  end
end
