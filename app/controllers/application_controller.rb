class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes' do
    erb :'recipes/index'
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:recipe_name],
                            ingredients: params[:recipe_ingredients],
                            cook_time: params[:recipe_cook_time])

    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/new' do
    erb :'recipes/new'
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :'recipes/edit'
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :'recipes/show'
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:recipe_name]
    @recipe.ingredients = params[:recipe_ingredients]
    @recipe.cook_time = params[:recipe_cook_time]
    @recipe.save

    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete

    redirect to '/recipes'
  end

end