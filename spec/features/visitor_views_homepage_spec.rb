require "rails_helper"

feature "Visitor views homepage" do
  scenario "to find information about the website" do
    visit root_path

    expect(page).to have_css '[data-role="intro"]',
      text: "Online banking made simple"
  end
end
