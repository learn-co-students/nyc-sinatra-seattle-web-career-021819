class FiguresController < ApplicationController
  set :views, 'app/views/figures'

  # add controller methods
  get '/figures' do
    erb :index
  end

  get '/figures/new' do
    erb :new
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :show
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :edit
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(name: params[:figure][:name])

    if (params[:figure][:landmark])
      figure.landmarks << params[:figure][:landmark]
    end

    redirect "/figures/#{figure.id}"
  end

  post '/figures' do
    var = Figure.create(params[:figure])

    if params[:title][:name] != ""
       var.titles << Title.create(params[:title])
     end
     if params[:landmark][:name] != ""
      var.landmarks << Landmark.create(params[:title])
    end
    #binding.pry
  end
end
