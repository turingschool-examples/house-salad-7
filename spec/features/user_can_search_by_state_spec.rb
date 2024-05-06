require 'rails_helper'

feature "user can search for members" do

  scenario "user submits valid state name", :vcr do
    # As a user
    # When I visit "/"
    visit '/'

    select "Colorado", from: :state
    # And I select "Colorado" from the dropdown
    click_on "Locate Representatives"
    # And I click on "Locate Representatives"
    expect(current_path).to eq(search_path)
    # I should see a list the members for Colorado

    within(first(".member")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".party")
      expect(page).to have_css(".state")
    end
  end
    # And I should see a name, role, party, and state for each member
end