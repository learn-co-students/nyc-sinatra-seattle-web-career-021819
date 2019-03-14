class FiguresController < ApplicationController
  # set :views, 'app/views/figures'

  get "/figures" do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get "/figure/new" do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"/figures/new"
  end

  post "/figures/:id" do
    @figure = Figure.create(params[:figure])
    # if !params["landmark"]["name"].empty?
    #   @figure.landmarks << Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])
    # end
    redirect "/figures/#{@figure.id}"
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end
end
