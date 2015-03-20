require "test_helper"

feature "Deleting A Theme" do
  scenario "A user choosed to delete their how to" do

    visit theme_path(themes(:theme_1))

    #page.must_have_content "Hello World"
    #page.wont_have_content "Goobye All!"
  end
end
