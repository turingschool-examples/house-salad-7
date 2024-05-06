require "rails_helper"

RSpec.describe Member do
  it "exists" do
    attrs = {
      name: "Leslie Knope",
      partyName: "Pizza",
      state: "Indiana"
    }

    member = Member.new(attrs)

    expect(member).to be_a Member
    expect(member.name).to eq("Leslie Knope")
    expect(member.party).to eq("Pizza")
    expect(member.state).to eq("Indiana")
  end
end