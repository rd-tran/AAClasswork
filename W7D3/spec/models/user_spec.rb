require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) { User.create(username: 'test_name', email: 'test@test.com', password: 'password') }

  describe 'Validations' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_presence_of(:password_digest) }
  end

  describe 'Associations' do
    it { should have_many(:goals) }
  end

end
