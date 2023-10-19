require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'Munana', email: 'munana@gmail.com', password: '123456') }
  describe 'validations' do
    it 'the user to be valid' do
      expect(user).to be_valid
    end
    it 'the user name should be provided' do
      user.name = nil
      expect(user).to_not be_valid
    end
    it 'the email should valid should have /@/.' do
      user.email = 'hack'
      expect(user).to_not be_valid
    end
  end
end
