require 'rails_helper'

RSpec.describe 'Category specs', type: :feature do
  before(:each) do
    Category.delete_all
    User.delete_all
    @user = User.create!(name: 'Munana', email: 'munana@gmail.com', password: 'abcxyz123',
                         password_confirmation: 'abcxyz123')
    Category.create(name: 'hospital', icon: 'hospital', user: @user)

    visit new_user_session_path # Assuming this is your sign-in page
    fill_in 'Enter your Email', with: @user.email
    fill_in 'Enter password', with: @user.password
    click_button 'Log in'
    visit categories_path
  end

  it 'see the title of a route' do
    expect(page).to have_content('TRANSANCTION')
  end
  it 'to have Content hospital' do
    expect(page).to have_content('hospital')
  end
  it 'to have content icon' do
    expect(page).to have_content('hospital')
  end
  it 'to have content icon' do
    expect(page).to have_content('$0.0')
  end
  it 'to have content icon' do
    click_on 'hospital'
    expect(page).to have_content('PAYMENTS')
  end
  it 'to have content icon' do
    click_on 'Add New Transaction'
    expect(page).to have_content('NEW TRANSACTION')
  end
end
