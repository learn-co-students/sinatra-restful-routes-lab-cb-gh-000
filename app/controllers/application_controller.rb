class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes' do
  end

  post '/recipes' do
  end

  get '/recipes/new' do
  end

  get '/recipes/:id/edit' do
  end

  get '/recipes/:id' do
  end

  patch '/recipes/:id' do
  end

  delete '/recipes/:id/delete' do
  end

end