require "rails_helper"

describe User, "associations" do
  it { should have_one(:account) }
end

describe User, "validations" do
  it { should validate_presence_of(:name) }
end
