require 'bookmark_library'
require 'database_helper'

describe Bookmark_Library do
  describe '.list_bookmarks' do
    it 'returns all bookmarks' do 
  
      # Add the test data
      bookmark = Bookmark_Library.add(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark_Library.add(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark_Library.add(url: "http://www.google.com", title: "Google")
   
      bookmarks = Bookmark_Library.list_bookmarks
   
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark_Library
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end
  describe '.add' do

    it 'creates a new bookmark' do
      bookmark = Bookmark_Library.add(url: 'http://www.example.org', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id)
      
      expect(bookmark).to be_a Bookmark_Library
      # expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.example.org'

    end
  end

  describe '.delete' do
    it 'deletes a bookmark from the page' do
      bookmark = Bookmark_Library.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      Bookmark_Library.delete(id: bookmark.id)
  
      expect(Bookmark_Library.list_bookmarks.length).to eq 0
    end
  end
      
end
