require "rails_helper"

feature "User makes deposit" do
  scenario "to credit money to their account" do
    receiving_user = user_with_account_balance_of "1"

    create_deposit amount: "1", receiver: receiving_user

    visit dashboard_path(as: receiving_user)

    expect(page).to have_content("Account balance: €2")
    expect(page).to have_content("Deposit")
    expect(page).to have_content "€1.00"
  end
end
