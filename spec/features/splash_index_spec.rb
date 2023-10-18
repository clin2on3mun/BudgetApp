require 'rails_helper'

RSpec.describe 'Category specs', type: :feature do
    before :each do
        visit root_path
    end
    it 'shows the app name ' do
        expect(page).to have_content('BudgetFriend')
      end
      it 'show the quote ' do
        expect(page).to have_content('Navigating Savings with Ease')
      end
      it 'shows the Log in button ' do
        expect(page).to have_content('LOG IN')
      end
    
      it 'shows the sign up button' do
        expect(page).to have_content('SIGN UP')
      end
end