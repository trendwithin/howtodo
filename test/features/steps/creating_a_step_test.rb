require "test_helper"

feature "Creating A Step" do
  scenario "A User creates a new step to their theme" do

    visit theme_path(themes(:theme_1))
    click_on 'Add New Step'

    fill_in 'Step', with: 'e4'
    click_on 'Add New Step'

    page.text.must_include 'successfully created'
    page.text.must_include 'e4'
    page.status_code.must_equal 200
  end

  scenario "Step is empty" do

    visit theme_path(themes(:theme_1))
    click_on "Add New Step"
    fill_in 'Step', with: ''
    click_on 'Add New Step'
    page.text.must_include 'prohibited this step'
    page.text.must_include  "Step can't be blank"
  end
end
