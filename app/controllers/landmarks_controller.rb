class LandmarksController < ApplicationController
  # set :views, 'app/views/landmarks'
  get '/landmarks' do
  @landmarks = Landmark.all
  erb :"/landmarks/index"
  end

  get '/landmarks/new' do
    @figures = Figure.all
    erb :"/landmarks/new"
  end

  post "/landmarks/:id" do
    @landmark = Landmark.create(params[:landmark])
    redirect "/landmarks/#{@landmark.id}"
  end

  get "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/show"
  end

end
