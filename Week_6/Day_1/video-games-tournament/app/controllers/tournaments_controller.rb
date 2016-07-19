class TournamentsController < ApplicationController
  def index
    render(:index)
  end

  def jsonindex
    @tournaments = Tournament.all
    render json: @tournaments
  end

  def new
    @new = Tournament.create(name: params[:tournament][:name])
    render json: @new
  end
end
