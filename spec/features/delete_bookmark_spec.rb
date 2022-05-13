feature 'user can delete a bookmark' do
  scenario 'a user can enter a title and press delete button' do
      Bookmark_Library.add(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      visit('/bookmarks')
      expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  
      first('.bookmark').click_button 'Delete'
    
    
      expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    end
end