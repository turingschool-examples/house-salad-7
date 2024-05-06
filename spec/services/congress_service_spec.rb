require 'rails_helper'

describe CongressService do
  context "class methods" do
    context "#members" do
      it "returns member data" do
        search = CongressService.new.members
        expect(search).to be_a Hash
        expect(search[:members]).to be_an Array
        member_data = search[:members].first

        expect(member_data).to have_key :name
        expect(member_data[:name]).to be_a(String)

        expect(member_data).to have_key :partyName
        expect(member_data[:partyName]).to be_a(String)

        expect(member_data).to have_key :state
        expect(member_data[:state]).to be_a(String)
      end
    end
  end
end