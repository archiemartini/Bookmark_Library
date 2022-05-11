require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark_library'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect "/bookmarks"
  end

  get '/bookmarks' do
    @bookmarks = Bookmark_Library.list_bookmarks
    erb :bookmarks
  end

  post '/added' do
    Bookmark_Library.add(params[:bookmark_title], params[:bookmark_url])
    redirect "/bookmarks"
  end

  run! if app_file == $0
end
