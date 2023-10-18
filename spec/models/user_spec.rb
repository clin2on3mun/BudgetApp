require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_1) { User.create(name: 'Munana', email: 'munana@gmail.com', password: '123456') }
  describe 'validations' do
    it "the user to be valid" do
      expect(user_1).to be_valid
    end
    it "the user name should be provided" do
      user_1.name = nil
      expect(user_1).to_not be_valid
    end
    it "the email should valid should have /@/." do
      user_1.email = 'hack'
      expect(user_1).to_not be_valid
    end
  end
end
