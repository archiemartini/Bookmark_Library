require 'pg'

feature 'displays list of bookmarks' do
  scenario 'user sees a list of bookmarks' do
    Bookmark_Library.add(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmark_Library.add(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
    Bookmark_Library.add(url: 'http://www.google.com', title: 'Google')

    visit '/bookmarks'

    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software',  href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  
  end
end
