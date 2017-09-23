class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end

  #set up a controller action that will render a form to create a new recipe.
  #This controller action should create and save this new recipe to the database.
  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
  end


  # create a controller action that uses RESTful routes to display a single recipe.
  # this recipe show page will have a form to delete a recipe via
  # a delete button
  get '/recipes/:id' do
    if @recipe = Recipe.find(params[:id])
      erb :recipe
    else
      erb :error
    end
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete

    redirect to '/recipes'
  end

  # Create a third controller action
  #that uses RESTful routes and renders a form to edit a single recipe.
  # This controller action should update the entry in the database with
  # the changes, and then redirect to the recipe show page
  get '/recipes/:id/edit' do

  end

  patch '/recipes/:id' do

  end

  # (index action) that displays all the recipes in the database.
  get '/recipes' do

  end

end
