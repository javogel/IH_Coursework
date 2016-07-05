
# Controller for main page
class SiteController < ApplicationController
  def home
    # render 'home' # name of view template
  end

  def contact
    # render 'contact' # name of view template
  end

  def say_name
    @name = params[:name]
    render 'say_name'
  end

  def calculator
    render 'calculator'
  end

  def calculate
    @first = params[:first_num]
    @second = params[:second_num]
    @sum = @first.to_i + @second.to_i
    render 'calculate'
  end
end
