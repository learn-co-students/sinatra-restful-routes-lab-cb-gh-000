class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
    @recipes = Recipe.all
    erb :index
  end
  
  get '/recipes' do 
    @recipes = Recipe.all
    erb :index
  end
  
  get '/recipes/new' do # New form
    erb :new
  end
  
  get '/recipes/:id' do  # Show page of recipe 
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end
  
  post '/recipes' do # Save recipe to database
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end
  
  get '/recipes/:id/edit' do # Edit form 
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit 
  end
  
  patch '/recipes/:id' do # Update recipe 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save 
    redirect to "/recipes/#{@recipe.id}"
  end
  
  delete '/recipes/:id/delete' do # delete recipe
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete 
    redirect to "/recipes"
  end
end