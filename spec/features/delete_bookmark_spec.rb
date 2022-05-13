feature 'user can delete a bookmark' do
  scenario 'a user can enter a title and press delete button' do
  Bookmark_Library.add(url: 'http://www.theguardian.com', title: 'The Guardian')
  visit('/bookmarks')
  fill_in :bookmark_delete, with: 'The Guardian'
  click_button 'Delete'
  visit('/bookmarks')
  expect(page).not_to have_link('The Guardian', href: 'http://www.theguardian.com')
 end
end