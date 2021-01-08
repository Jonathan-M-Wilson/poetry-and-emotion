require 'rails_helper'

RSpec.describe 'Poems show page' do
  before :each do
    visit '/'
    fill_in :author, with: 'Emily'
    click_on 'Get Poems'
  end

  it "returns 10 poems by author keyword search" do
    expect(current_path).to eq('/search')
    within('.search_results') do
      expect(page).to have_content('Title:', count:10)
    end
  end

  xit "displays a title, author, and poem for each result" do
    expect(current_path).to eq('/search')

    within(".poem-#{}") do
      expect(page).to have_content(title)
      expect(page).to have_content(author)
      expect(page).to have_content(string)
      expect(page).to have_content(tone)
    end
  end
end

# When I visit "/"
# And I fill in "Emily" in the textfield(Note: Use the existing search form)
# And I click "Get Poems"
# Then I should be on page "/search"
# Then I should see a list of the first 10 poems
# Then I should see the tone or tones listed for each poem.
# For each poem I should see
# - Title
# - Author
# - The poem(as a single string)
# I should also see:
# - The tone or tones for each poem
