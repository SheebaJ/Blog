require 'rails_helper'

RSpec.describe Category, type: :model do
  it "has a valid factory" do
    FactoryBot.build_stubbed(:category).should be_valid
  end

  it "is invalid without a name" do
    FactoryBot.build(:category,name: nil).should_not be_valid
  end

  it "is invalid without a description" do
    FactoryBot.build(:category, description: nil).should_not be_valid
  end

  it "is invalid without description and with name" do
    FactoryBot.build(:category, description: nil ,name:"check").should_not be_valid
  end

  it "is invalid without description and with name" do
    FactoryBot.build(:category, description: "check" ,name:nil).should_not be_valid
  end

  it "is invalid when both nil" do
    FactoryBot.build(:category, description:nil ,name:nil).should_not be_valid
  end

end