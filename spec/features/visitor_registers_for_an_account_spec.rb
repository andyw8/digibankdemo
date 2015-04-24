require "rails_helper"

feature "Visitor registers for an acount" do
  scenario "providing name, email and password" do
    visit root_path
    click_link "Register an account"
    fill_in "Name", with: "Example User"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "examplepass"
    click_button "Register account"

    expect(page).to have_content "Welcome, Example User"
  end

  scenario "with invalid data" do
    user = create :user

    visit root_path
    click_link "Register an account"
    fill_in "Name", with: "Example User"
    fill_in "Email", with: user.email
    click_button "Register account"

    expect(page).to have_content "Email has already been taken"
  end
end
