class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do 
    @recipes = Recipe.all
    erb :index
  end

   #create
  get '/recipes/new' do 
    erb :new
  end

  post '/recipes' do 
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end


  #show one particular recipe based on the id
  get '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  #update 
  get '/recipes/:id/edit' do 
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end


  patch '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end

  #delete
  delete '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.destroy
    redirect to '/recipes'
  end

end
