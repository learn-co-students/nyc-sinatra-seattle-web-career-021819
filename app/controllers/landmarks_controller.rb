class LandmarksController < ApplicationController
  # add controller methods
  set :views, 'app/views/landmarks'

  # add controller methods
  get '/landmarks' do
    erb :index
  end

  get '/landmarks/new' do
    erb :new
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :show
  end

  get '/landmarks/:id/edit' do
    #binding.pry
    @landmark = Landmark.find(params[:id])
    erb :edit
  end

  patch '/landmarks/:id' do
    landmark = Landmark.find(params[:id])
    landmark.update(params[:landmark])
    redirect "/landmarks/#{params[:id]}"
  end

  post '/landmarks' do
    Landmark.create(params[:landmark])
    redirect '/landmarks'
  end
end
