require "rails_helper"

RSpec.describe Day, :type => :model do
  it "belongs to baby" do
    day1 = Day.create!(baby_id: 1, status: 'Good')
    expect(day1.baby_id).to_not eq(nil)
  end

  it "belongs to user" do
    day1 = Day.create!(user_id: 1, status: 'Good')
    expect(day1.user_id).to_not eq(nil)
  end

  it "has many events" do
    day1 = Day.create!(baby_id: 1, status: 'Good')
    expect(day1.events).to eq([])
  end

end