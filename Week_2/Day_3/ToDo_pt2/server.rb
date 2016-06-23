require 'sinatra'
require 'sinatra/reloader'
require 'yaml/store'
require 'pry'
require_relative('lib/SaveLoad.rb')
require_relative('lib/Task.rb')
require_relative('lib/TodoList.rb')


todo_list = TodoList.new("Josh")
# todo_list.load_tasks


get "/" do
  @todo_list = todo_list
  erb :home
end


get "/new_task" do
  erb :add
end

post "/create_task" do
  @task = params[:task]
  todo_list.add_task(Task.new(@task))

  redirect to("/")
end


get "/complete/:id" do
  @id = params[:id].to_i

  todo_list.find_task_by_id(@id).complete!

  redirect to("/")
end


get "/delete/:id" do
  @id = params[:id].to_i

  todo_list.delete_task(@id)

  redirect to("/")
end
