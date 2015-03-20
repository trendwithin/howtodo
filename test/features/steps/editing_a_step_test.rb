require "test_helper"

feature "Editing A Step" do
  scenario "A user edits an existing step" do

    visit edit_theme_step_path(themes(:theme_1), steps(:step_1))

    fill_in "Step", with: 'e2-e4'
    click_on 'Add New Step'

    page.text.must_include 'successfully updated'
    page.text.must_include 'e2-e4'
  end

  scenario 'User leaves step empty' do

    visit edit_theme_step_path(themes(:theme_1), steps(:step_1))

    fill_in 'Step', with: ""
    click_on 'Add New Step'
    page.text.must_include 'prohibited this step from being saved'
    page.text.must_include "Step can't be blank"
  end
end
