# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    subject { User.new(name: "Name", email: "test@gmail.com") }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end
end
