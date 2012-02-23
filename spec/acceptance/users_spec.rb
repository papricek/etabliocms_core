require 'acceptance/acceptance_helper'

feature 'Users', '' do

  scenario 'Some crud for admin' do
    user = FactoryGirl.create(:user)
    visit "/sign_in"
    page.should have_content("Sign in")
  end

end
