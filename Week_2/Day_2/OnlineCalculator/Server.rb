# server.rb
require 'sinatra'
require 'sinatra/reloader' 
require_relative './lib/Calculator'


get "/" do
  erb(:home)
end

get "/add" do
  erb(:add)
end

get "/subtract" do
  erb(:subtract)
end

get "/multiply" do
  erb(:multiply)
end

get "/divide" do
  erb(:divide)
end

get "/all" do

  @result = params[:lastresult].to_f
  erb(:all)
end

post "/calculate_add" do
  @first = params[:first_number].to_f
  @second = params[:second_number].to_f
  @result = Calculator.add(@first, @second)
  redirect to("/success?result=#{@result}")
end

post "/calculate_subtract" do
  @first = params[:first_number].to_f
  @second = params[:second_number].to_f
  @result = Calculator.subtract(@first, @second)
  redirect to("/success?result=#{@result}")
end

post "/calculate_multiply" do
  @first = params[:first_number].to_f
  @second = params[:second_number].to_f
  @result = Calculator.multiply(@first, @second)
  redirect to("/success?result=#{@result}")
end

post "/calculate_divide" do
  @first = params[:first_number].to_f
  @second = params[:second_number].to_f
  @result = Calculator.divide(@first, @second)
  redirect to("/success?result=#{@result}")
end

post "/calculate_all" do
  @first = params[:first_number].to_f
  @second = params[:second_number].to_f
  @operation = params["operation"]
  @result = Calculator.calculate(@first, @second, @operation )
  if @operation=="load"
    @lastresult = Calculator.load
    redirect to("/all?lastresult=#{@lastresult}")
  else
    redirect to("/success?result=#{@result}&first=#{@first}&second=#{@second}&operation=#{@operation}")
  end
end


post "/save" do
  @result = params[:result].to_f
  Calculator.save(@result)
  redirect to("/")
end





get "/success" do
 @result = params[:result].to_f
 @resulting_string = "The result of #{params[:operation]} number #{params[:first]} and number #{params[:second]} is #{params[:result]}"
 erb(:success)
end
