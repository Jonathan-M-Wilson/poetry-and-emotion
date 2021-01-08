require 'rails_helper'

RSpec.describe 'Poems show page' do
  before :each do
    visit '/'
    fill_in :author, with: 'Emily'
    click_on 'Get Poems'
  end

  it "returns 10 poems by author keyword search" do
    expect(current_path).to eq('/search')
    within('.search-results') do
      expect(page).to have_content('Title:', count:10)
    end
  end

  it "displays a title, author, and poem for each result" do
    expect(current_path).to eq('/search')

    within(".poem-#{"Callers"}") do
      expect(page).to have_content("Title: Not at Home to Callers")
      expect(page).to have_content('by: Emily Dickinson')
      expect(page).to have_content('Poem: Not at Home to Callers Says the Naked Tree -- Bonnet due in April -- Wishing you Good Day --')
      expect(page).to have_content("Joy")
    end
  end
end

# I should also see:
# - The tone or tones for each poem
