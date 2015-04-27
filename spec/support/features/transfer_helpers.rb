module TransferHelpers
  def transfer(from:, to:, amount:)
    visit dashboard_path(as: from)
    click_link "Make transfer"
    select to.name
    fill_in "Amount", with: amount
    click_button "Transfer"
  end
end
