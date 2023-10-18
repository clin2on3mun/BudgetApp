require 'rails_helper'

RSpec.describe 'Category specs', type: :feature do
  before(:each) do
    Payment.delete_all
    Category.delete_all
    User.delete_all
    @user = User.create!(name: 'Munana', email: 'munana@gmail.com', password: 'abcxyz123',
                         password_confirmation: 'abcxyz123')
    @category= Category.create(name: 'hospital', icon: 'hospital', user: @user) 
    @payment1 = Payment.create(name:'Psychologist', amount: 10.0, user: @user)
    CategoryPayment.create(category:@category, payment: @payment1)
    @payment2 = Payment.create(name:'Dentist', amount: 200.0, user: @user)
    CategoryPayment.create(category:@category, payment: @payment2)

    visit new_user_session_path # Assuming this is your sign-in page
    fill_in 'Enter your Email', with: @user.email
    fill_in 'Enter password', with: @user.password
    click_button 'Log in'
    visit category_payments_path(@category)
  end

  it 'to have content icon' do
    expect(page).to have_content('PAYMENTS')
  end
  it 'to have content icon' do
    expect(page).to have_content('Psychologist')
    expect(page).to have_content('Dentist')
  end
  it 'to show amount' do
    expect(page).to have_content('$10.0')
    expect(page).to have_content('$200.0')
  end
  it 'to show category and amount' do
    expect(page).to have_content('hospital')
    expect(page).to have_content('$210.0')
  end
  it 'to show category and amount' do
    click_on 'Add New Payment'
    expect(page).to have_content('hospital')
  end
end
