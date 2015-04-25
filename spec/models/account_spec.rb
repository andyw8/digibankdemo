require "rails_helper"

describe Account, "associations" do
  it { should belong_to(:user) }
end
