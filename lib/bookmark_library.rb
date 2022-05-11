require 'pg'

class Bookmark_Library
  def self.list_bookmarks
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else  
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    
    result = connection.exec("SELECT * FROM bookmarks")
    p result.map { |bookmark| bookmark['titles'] + ': ' + bookmark['url'] }
  end

  def self.add(title, url)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else  
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    
    connection.exec("INSERT INTO bookmarks (titles, url) VALUES('#{title}', '#{url}');")
    end
end
