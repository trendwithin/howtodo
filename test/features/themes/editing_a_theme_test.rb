require "test_helper"

feature "Editing A Theme" do
  scenario "A user decides to edit their existing theme" do

    # Given an existing theme
    visit edit_theme_path(themes(:theme_2))

    # When the content is edited
    fill_in 'Title', with: 'Playing the English Symetrical'
    click_on 'Create New Theme'

    # Then the theme is updated
    page.text.must_include "Theme was successfully updated"
    page.text.must_include "Playing the English"
  end

  scenario "Insufficient input to validate a new theme" do

    # Given an existing theme
    visit edit_theme_path(themes(:theme_2))

    # When the theme name is too short
    fill_in 'Title', with: "One"
    click_on 'Create New Theme'

    page.text.must_include "prohibited this theme from being saved"
    page.text.must_include "Title is too short"
  end
end
