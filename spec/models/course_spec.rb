require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'validations' do
    it { should belong_to(:author) }
    it {should validate_presence_of(:author)}
    it {should validate_presence_of(:name)}
  end
end
