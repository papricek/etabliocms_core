# encoding: utf-8
require 'acceptance/acceptance_helper'

feature 'Users', '' do

  scenario 'Some crud for admin' do
    user = FactoryGirl.create(:user)
    visit "/sign_in"
    page.should have_content('Sign in')
    fill_in 'Email', :with => user.email
    fill_in 'Heslo', :with => '123456'
    click_button('Sign in')
    page.should have_content('Přihlášení proběhlo úspěšně.')
    click_link('Uživatelé (1)')
    page.should have_content('Uživatelé')
    page.should have_content(user.email)
    click_link('Přidat uživatele »')
    fill_in 'Email', :with => 'email@gmail.com'
    fill_in 'Heslo', :with => 'short'
    click_button('Uložit')
    page.should have_content('Heslo je příliš krátký')
    page.should have_content('Heslo nebylo potvrzeno')
    fill_in 'Heslo', :with => 'good2go'
    fill_in 'Potvrzení hesla', :with => 'good2go'
    click_button('Uložit')
    page.should have_content('Uživatel byl úspěšně vytvořen.')
  end

end
