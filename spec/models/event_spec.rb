require "rails_helper"

RSpec.describe Event, :type => :model do

  it "belongs to user" do
    event1 = Event.create!(user_id: 1)
    expect(event1.user_id).to_not eq(nil)
  end

  it "belongs to day" do
    event1 = Event.create!(day_id: 1)
    expect(event1.day_id).to eq(1)
  end

end