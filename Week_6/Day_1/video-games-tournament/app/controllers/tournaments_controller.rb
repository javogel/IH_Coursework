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

  def destroy
    item = Tournament.find(params[:id])
    item.destroy
    render json: item
  end
end
