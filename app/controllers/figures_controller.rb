class FiguresController < ApplicationController
  # set :views, 'app/views/figures'

  get "/figures" do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get "/figures/new" do
    erb :"/figures/new"
  end

end
