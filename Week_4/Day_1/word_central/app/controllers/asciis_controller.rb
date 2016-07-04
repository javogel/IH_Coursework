class AsciisController < ApplicationController
  def new
    render 'new'
  end

  def create
    @a = Artii::Base.new :font => 'slant'
    @render = @a.asciify(params[:text_inspection][:user_text])
    render 'result'
  end
end
