require 'rails_helper'

RSpec.describe 'Congress Search' do
  describe 'happy path' do
    it 'allows user to search for Senators by last name' do
      visit root_path

      fill_in :search, with: 'Sanders'
      fill_in :state, with: "VT"
      click_button 'Search'

      expect(page.status_code).to eq 200
      expect(page).to have_content('Sanders, Bernard was found!')
      expect(page.find('.senator-image')['src']).to have_content('https://www.congress.gov/img/member/s000033_200.jpg')
    end

    it 'allows user to search for another govt member' do
      visit root_path

      fill_in :search, with: 'Booker'
      fill_in :state, with: "NJ"
      click_button 'Search'

      expect(page.status_code).to eq 200
      expect(page).to have_content("Booker, Cory A. was found!")
      expect(page.find('.senator-image')['src']).to have_content('https://www.congress.gov/img/member/b001288_200.jpg')
    end
  end
end