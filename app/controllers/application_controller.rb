class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all
     erb :index
   end

  post '/recipes' do
    recipe = Recipe.new(name: params["name"], ingredients: params["ingredients"], cook_time: params["cook_time"])
    if recipe.save
      redirect "/recipes/#{recipe.id}"
    else
      redirect '/'
    end
  end

  get '/recipes/new' do
    erb :edit
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    if @recipe
      erb :recipe
    else
      redirect '/'
    end
  end

  patch '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    if recipe
      recipe.update(name: params["name"], ingredients: params["ingredients"], cook_time: params["cook_time"])
      redirect "/recipes/#{params[:id]}"
    else
      redirect '/'
    end
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    if @recipe
      erb :edit
    else
      redirect '/'
    end
  end

  delete '/recipes/:id/delete' do
    recipe = Recipe.find(params[:id])
    recipe ? recipe.destroy : redirect('/')
  end

end
