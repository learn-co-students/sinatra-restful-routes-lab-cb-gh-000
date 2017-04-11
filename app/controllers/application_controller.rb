require "better_errors"
class ApplicationController < Sinatra::Base

  configure :development do
    require 'better_errors'
    use BetterErrors::Middleware
    BetterErrors.application_root = File.expand_path('..', __FILE__)
  end

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do
    erb :new_recipe
  end

  post '/recipes' do
    @recipe = Recipe.create(
      name: params[:name],
      ingredients: params[:ingredients],
      cook_time: params[:cook_time]
    )
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect '/recipes'
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit_recipe
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(
      name: params[:name],
      ingredients: params[:ingredients],
      cook_time: params[:cook_time]
    )
    redirect to "/recipes/#{@recipe.id}"
  end

end
