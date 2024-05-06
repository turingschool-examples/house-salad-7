require 'rails_helper'

RSpec.describe 'Senator Search' do
  describe 'happy path' do
    it 'allows user to search for Senators by last name' do
      json_response = File.read('spec/fixtures/members_of_the_senate.json')
      stub_request(:get, "https://api.congress.gov/v3/member?limit=250").to_return(status: 200, body: json_response)

      visit root_path

      fill_in :search, with: 'Sanders'
      click_button 'Search'

      expect(page.status_code).to eq 200
      expect(page).to have_content('Sanders, Bernard was found!')
      expect(page.find('.senator-image')['src']).to have_content('https://www.congress.gov/img/member/s000033_200.jpg')
    end

    it 'allows user to search for another govt member' do
      visit root_path

      fill_in :search, with: 'Booker'
      click_button 'Search'

      expect(page.status_code).to eq 200
      expect(page).to have_content("Booker, Cory A. was found!")
      expect(page.find('.senator-image')['src']).to have_content('https://www.congress.gov/img/member/b001288_200.jpg')
    end
  end
end