class FiguresController < ApplicationController
  get "/figures" do
    @figures = Figure.all
  end
end
