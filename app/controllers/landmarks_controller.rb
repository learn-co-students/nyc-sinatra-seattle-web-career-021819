class LandmarksController < ApplicationController
  set :views, proc { File.join(root, '../views/landmarks') }

  #CREATE
  get '/landmarks/new' do
    erb :new
  end

  post '/landmarks' do
    Landmark.create(params[:landmark])
    erb :index
  end

  #READ
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :index
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :show
  end

  #UPDATE
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :edit
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    binding.pry
    @landmark.update(params[:landmark])
    binding.pry
    redirect :"/landmarks/#{@landmark.id}"
  end


end
