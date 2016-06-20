require 'yaml/store'


module SaveLoad

  def save
    @todo_store.transaction do
      @todo_store[@user] = @tasks
    end
  end

  def load_tasks
    @loaded = YAML.load_file("../public/tasks.yml")
    @tasks = @loaded["Josh"]
  end

end



class TodoList

  include SaveLoad

    attr_reader :user, :tasks
    def initialize(user)
        @todo_store = YAML::Store.new("../public/tasks.yml")
        @tasks = []
        @user = user
        @loaded = {}
    end


    def add_task(task)
      @tasks << Task.new(task)
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


class Task
    attr_reader :content, :id, :created_at
    @@current_id = 1

    def initialize(content)
        @content = content
        @id = @@current_id
        @complete = false
        @created_at = Time.now

        @@current_id += 1
        @updated_at = nil


    end

    def complete?
      @complete
    end

    def complete!
      @complete = true
    end

    def make_incomplete!
      @complete = false
    end

    def update_content!(updated_content)
      @content = updated_content
      @updated_at = Time.now
    end
end
