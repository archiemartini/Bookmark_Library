require 'pg'

feature 'user can add a bookmark' do
  scenario 'bookmark added to page' do
    visit('/bookmarks')
    fill_in :bookmark_title, with: 'Github'
    fill_in :bookmark_url, with: 'http://www.github.com/'
    click_button 'add'
    expect(page).to have_content('Github: http://www.github.com/')
  end
end
