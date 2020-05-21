require 'rails_helper'

RSpec.describe Goal, type: :model do

  let(:user) { User.create(username: 'test_name', email: 'test@test.com', password: 'password') }
  subject(:idk) { Goal.create(title: 'My First Goal', description: 'asdf', user_id: 1) }

  describe 'Validates' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:user_id) }
    it { should validate_uniqueness_of(:title).scoped_to(:user_id) }
  end

  describe 'Associations' do
    it { should belong_to(:user) }
  end

end
