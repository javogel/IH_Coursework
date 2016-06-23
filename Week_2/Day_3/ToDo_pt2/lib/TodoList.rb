

class TodoList

  include SaveLoad

    attr_reader :user, :tasks
    def initialize(user)
        @todo_store = YAML::Store.new("./public/tasks.yml")
        @tasks = []
        @user = user
        @loaded = {}
    end


    def add_task(task)
      @tasks << task
    end

    def delete_task(index)
     @tasks.delete_if {|x| x.id == index}
    end

    def find_task_by_id(i)
     @tasks.find {|x| x.id == i}
    end

    def sort_by_id
     @tasks.sort! { | task1, task2 | task1.id <=> task2.id }
    end

    def sort_by_created(order = "asc")

      if order == "asc"
        @tasks.sort! { | task1, task2 | task1.created_at <=> task2.created_at }
      elsif order == "desc"
        @tasks.sort! { | task1, task2 | task2.created_at <=> task1.created_at }
      end

    end

end
