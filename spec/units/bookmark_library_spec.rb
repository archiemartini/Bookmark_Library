require 'bookmark_library'

describe Bookmark_Library do
  describe '.list_bookmarks' do
    it 'returns all bookmarks' do 
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (titles, url) VALUES ('Makers', 'http://www.makersacademy.com/');")
      connection.exec("INSERT INTO bookmarks (titles, url) VALUES ('Destroy All Software', 'http://www.destroyallsoftware.com/');")
      connection.exec("INSERT INTO bookmarks (titles, url) VALUES ('Google', 'http://www.google.com/');")

      bookmarks = Bookmark_Library.list_bookmarks
      
      expect(bookmarks).to include('Makers: http://www.makersacademy.com/')
      expect(bookmarks).to include('Destroy All Software: http://www.destroyallsoftware.com/')
      expect(bookmarks).to include('Google: http://www.google.com/')
    end
  end
  describe '.add' do

    it 'adds a bookmark' do
      Bookmark_Library.add('Github', 'http://www.github.com/')
      connection = PG.connect(dbname: 'bookmark_manager_test')
      result = connection.exec("SELECT * FROM bookmarks;")
      urls = result.map { |bookmark| bookmark['url']}
      expect(urls).to include 'http://www.github.com/'
    end
    
    it 'has a title' do
      Bookmark_Library.add('Github', 'http://www.github.com/')
      connection = PG.connect(dbname: 'bookmark_manager_test')
      result = connection.exec("SELECT * FROM bookmarks;")
      titles = result.map { |bookmark| bookmark['titles']}
      expect(titles).to include 'Github'
    end
  end

end