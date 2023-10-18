require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'Munana', email: 'munana@gmail.com', password: '123456') }
  let(:category) { Category.create(name: 'hospital', icon: 'hospital', user: user) }
  describe 'validations' do
    it 'category to be valid' do
      expect(category).to be_valid
    end
    it 'category to be valid' do
      category.name = nil
      expect(category).to_not be_valid
    end
  end
end
