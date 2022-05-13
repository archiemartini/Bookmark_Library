require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark_library'

class BookmarkManager < Sinatra::Base
  
  enable :sessions, :method_override
  
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
    Bookmark_Library.add(url: params[:bookmark_url], title: params[:bookmark_title])
    redirect "/bookmarks"
  end

  delete 'bookmarks/:id' do
    Bookmark_Library.delete(id: params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
