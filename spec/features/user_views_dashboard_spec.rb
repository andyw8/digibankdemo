require "rails_helper"

feature "User views dashboard" do
  scenario "to view information regarding their account balance" do
    user = create :user
    account = create :account, user: user

    visit dashboard_path(as: user)

    expect(page).to have_content(
      "Account balance: €#{account.balance}"
    )
  end
end
