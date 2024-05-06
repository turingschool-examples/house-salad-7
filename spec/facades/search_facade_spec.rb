require 'rails_helper'

RSpec.describe SearchFacade do

  it "exists and has a state attribute" do
    facade = SearchFacade.new("Colorado")

    expect(facade).to be_a(SearchFacade)
    expect(facade.instance_variable_get(:@state)).to eq("Colorado")
  end

  it "returns an array of Member objects" do
    facade = SearchFacade.new("Colorado")

    expect(facade.members_by_state).to be_a(Array)
    facade.members_by_state.each do |member|
      expect(member).to be_a(Member)
    end
  end
end