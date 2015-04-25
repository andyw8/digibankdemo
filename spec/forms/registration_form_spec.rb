require "rails_helper"

describe RegistrationForm, "#submit" do
  it "register the user and creates the respective account" do
    user_attributes = attributes_for :user
    account_model = stub_const("Account", spy(:account_model))
    user_model = stub_const("User", spy(:user_model))

    RegistrationForm.new(user_attributes).submit

    expect(user_model).to have_received(:new).with(user_attributes)
    expect(user_model).to have_received(:build_account)
    expect(user_model).to have_receive(:save!)
    expect(account_model).to have_receive(:save!)
  end
end
