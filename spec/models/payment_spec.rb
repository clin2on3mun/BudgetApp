require 'rails_helper'

RSpec.describe Payment, type: :model do
  let(:user_1) { User.create(name: 'Munana', email: 'munana@gmail.com', password: '123456') }
  let (:payment) {Payment.create(name: 'Psychology', amount: 10.0, user: user_1)}
  describe 'Validation' do
    it 'payment to be valid' do
      expect(payment).to be_valid
    end
    it 'name user should insert name' do
      payment.name = nil
      expect(payment).to_not be_valid
    end
    it 'name user should insert name' do
      payment.amount = nil
      expect(payment).to_not be_valid
    end
  end
end
