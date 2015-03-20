require "test_helper"

feature "Viewing Themes" do
  scenario "A user views a listing of themes" do

    # Given a list of themes
    visit themes_path
    page.text.must_include "French"
    page.text.must_include "Dragon"
  end
end
