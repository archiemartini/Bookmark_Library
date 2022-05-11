require 'pg'

feature 'displays list of bookmarks' do
  scenario 'user sees a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'Makers', 'http://www.makersacademy.com/');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'Destroy All Software', 'http://www.destroyallsoftware.com/');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'Google', 'http://www.google.com/');")

    visit '/bookmarks'
    expect(has_expected_content(page)).to be true
  end
  
end
