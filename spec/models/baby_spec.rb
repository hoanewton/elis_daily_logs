require "rails_helper"

RSpec.describe Baby, :type => :model do
  it "validate presence of first name" do
    alex = Baby.create!(first_name: "Alex", last_name: "Ackerman", age: 1)

    expect(alex.first_name).to eq("Alex")
  end
  it "validate presence of last name" do
    alex = Baby.create!(first_name: "Alex", last_name: "Ackerman", age: 1)

    expect(alex.last_name).to eq("Ackerman")
  end
  it "validate numericality of age" do
    alex = Baby.create!(first_name: "Alex", last_name: "Ackerman", age: 1)

    expect(alex.valid?).to eq(true)
  end
  
end

