require 'pg'

class Bookmark_Library

  attr_reader :id, :url, :title

  def initialize(id:, url:, title:)
    @id = id
    @url = url
    @title = title
  end

  def self.list_bookmarks
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else  
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    
    result = connection.exec("INSERT INTO bookmarks (url, titles) VALUES('#{url}', '#{title}') RETURNING id, titles, url;")
    result.map do |bookmark| 
      Bookmark_Library.new(id: bookmark['id'], title: bookmark['titles'], url: bookmark['url'])
    end
  end

  def self.add(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else  
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    
    result = connection.exec("INSERT INTO bookmarks (url, titles) VALUES('#{url}', '#{title}') RETURNING id, titles, url;")
    Bookmark_Library.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])

  end
end
