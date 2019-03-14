class FiguresController < ApplicationController

  ## INDEX ##
    get '/figures' do
      @figures = Figure.all
      erb :"figures/index"
    end

  ## NEW ##
    get '/figures/new' do
      @titles = Title.all
      @landmarks = Landmark.all
      erb :"figures/new"
    end

    post '/figures' do
      @figure = Figure.create(params[:figure])
      if !params["title"]["name"].empty?
        @title = Title.create(params[:title])
        @title.save
        @figure.titles << @title
      end
      if !params["landmark"]["name"].empty?
        @landmark = Landmark.create(params[:landmark])
        @landmark.save
        @figure.landmarks << @landmark
      end
      @figure.save
      redirect to "/figures/#{@figure.id}"
    end

  ## SHOW ##
    get '/figures/:id' do
      @figure = Figure.find(params[:id])
      erb :"figures/show"
    end

  ## EDIT ##
  get '/figures/:id/edit' do
    @titles = Title.all
    @landmarks = Landmark.all
    @figure = Figure.find(params[:id])
    erb :"figures/edit"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params["title"]["name"].empty?
      @title = Title.create(params[:title])
      @title.save
      @figure.titles << @title
    end
    if !params["landmark"]["name"].empty?
      @landmark = Landmark.create(params[:landmark])
      @landmark.save
      @figure.landmarks << @landmark
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

end
