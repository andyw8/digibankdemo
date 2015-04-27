require "rails_helper"

feature "User makes transfer" do
  scenario "to another user" do
    emitting_user = user_with_account_balance_of "2"
    receiving_user = user_with_account_balance_of "3"

    visit dashboard_path(as: emitting_user)
    transfer from: emitting_user, to: receiving_user, amount: "1"

    expect(page).to have_content "Transfer successfully made"
    expect(page).to have_content("Account balance: €1")

    visit dashboard_path(as: receiving_user)

    expect(page).to have_content("Account balance: €4")
  end

  scenario "without sufficient balance" do
    emitting_user = user_with_account_balance_of "0.0"
    receiving_user = user_with_account_balance_of "1"

    transfer from: emitting_user, to: receiving_user, amount: "1"

    expect(page).
      to have_content "You do not have sufficient funds to make this transfer"
  end

  scenario "and views the transaction registered on his dashboard" do
    emitting_user = user_with_account_balance_of "2"
    receiving_user = user_with_account_balance_of "1"

    transfer from: emitting_user, to: receiving_user, amount: "1"

    expect(page).to have_content "Debit"
    expect(page).to have_content "#{receiving_user.name}"
    expect(page).to have_content "€1.00"
  end
end
