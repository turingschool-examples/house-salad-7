require "rails_helper"

RSpec.describe Member do
  it "exists" do
    attrs = {
      first_name: "Leslie",
      last_name: "Knope",
      party: "Pizza"
    }

    member = Member.new(attrs)

    expect(member).to be_a Member
    expect(member.name).to eq("Leslie Knope")
    expect(member.party).to eq("Pizza")
  end
end