class FiguresController < ApplicationController

  get "/figures/new" do
    erb :"figures/new"
  end

  post "/figures" do
    figure = Figure.create(params[:figure])
    if params[:title][:name] != ""
      title = Title.create(params[:title])
      figure.titles << title
    end
    if params[:landmark][:name] != ""
      landmark = Landmark.create(params[:landmark])
      figure.landmarks << landmark
    end
    figure.save
    redirect to "/figures/#{figure.id}"
  end

  get "/figures" do
    @figures = Figure.all
    erb :"figures/index"
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  get "/figures/:id/edit" do
    @figure = Figure.find(params[:id])
    erb :"figures/edit"
  end

  patch "/figures/:id" do
    @figure = Figure.find(params[:id])
    @figure.update(name: params[:figure][:name])
    redirect to "/figures/#{figure.id}"
  end

end
