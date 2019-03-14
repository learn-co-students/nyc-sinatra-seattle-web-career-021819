class FiguresController < ApplicationController
  # add controller methods
    set :views, proc { File.join(root, '../views/figure') }

  #CREATE
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :new
  end

  post '/figures' do

    new_figure = Figure.create(params[:figure])
      if !params[:title].empty?
        new_title = Title.create(params[:title])
        FigureTitle.create(figure_id: new_figure.id, title_id: new_title.id)
      end
      if !params[:landmark].empty?
        new_landmark = Landmark.create(name: params[:landmark], figure_id:new_figure.id)
      end
      redirect "/figures"
  end

  #READ
  get '/figures' do
    @figures = Figure.all
    erb :index
  end

  get '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    erb :show
  end

  #UPDATE
  get '/figures/:id/edit' do
    @figure = Figure.find_by(params[:id])
    @titles = Title.all
    erb :edit
  end

  patch '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    @figure.update(params[:figure])
    if !params[:landmark].empty?
      new_landmark = Landmark.create(name: params[:landmark], figure_id:new_figure.id)
    end
    redirect  :"/figures/#{@figure.id}"
  end

end
