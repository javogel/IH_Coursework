class LipsumController < ApplicationController
  def new
    render 'new'
  end

  def create
    @number = params[:lipsum_text][:number].to_i
    @wop = params[:lipsum_text][:wop]
    @result = ''
    @wor = "Random_Word \n"
    @para = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
      incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
      ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
      voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
      proident, sunt in culpa qui officia deserunt mollit anim id est laborum. \n\n\n"
    if @wop == "word"
      @number.times do
        @result += @wor
      end
    elsif @wop == "paragraph"
      @number.times do
        @result += @para
      end
    end
    render 'result'
  end
end
