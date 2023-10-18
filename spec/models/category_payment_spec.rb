require 'rails_helper'

RSpec.describe CategoryPayment, type: :model do
  let(:user_1) { User.create(name: 'Munana', email: 'munana@gmail.com', password: '123456') }
  let (:payment) {Payment.create(name: 'Psychology', amount: 10.0, user: user_1)}
  let (:category) {Category.create(name: 'hospital', icon: 'hospital', user: user_1) }
  let (:category_payment) {CategoryPayment.create(category: category, payment: payment)}
  describe 'validation' do
    it 'CategoryPayment to do validation' do
      expect(category_payment).to be_valid
    end
    it 'category should be present' do
      category_payment.category = nil
      expect(category_payment).to_not be_valid
    end
    it 'payment id should be present' do
      category_payment.payment = nil
      expect(category_payment).to_not be_valid
    end
  end
end
