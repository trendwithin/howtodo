require "test_helper"

feature "Creating A New Theme" do
  scenario "User creates their new theme for to-do lists" do

    # Given a create theme form
    visit themes_path

    # When the user clicks to save
    click_on 'New Theme'

    # Then the theme should be saved
    fill_in 'Title', with: 'How to Play the French Winawer'
    click_on 'Create New Theme'

    page.text.must_include 'Theme was successfully created'
    page.text.must_include 'How to Play the French Winawer'
    page.wont_have_content "Goobye All!"
  end

  scenario 'Insufficient input to validate a new theme' do

    # Given a theme form
    visit themes_path
    click_on 'New Theme'

    # When a user puts in insufficient data
    fill_in 'Title', with: 'One'
    click_on 'Create New Theme'

    # Then the new theme should not be saved
    page.text.must_include "prohibited this theme"
    page.text.must_include "Title is too short"
  end
end
