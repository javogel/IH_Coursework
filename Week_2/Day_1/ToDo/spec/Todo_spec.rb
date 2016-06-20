require 'rspec'
require '../lib/Todo'




describe "Task" do

  before(:each) do
  @task = Task.new("Buy milk!")
  end

  describe "#new" do
    it "creates unique ID" do
      expect(@task.id).to eq(1)
    end
  end

  describe "complete?" do
    it "checks complete" do
      expect(@task.complete?).to eq(false)
    end

    it "complete! marks task as complete" do
      @task.complete!
      expect(@task.complete?).to eq(true)
    end

    it "marks task as incomplete" do
      @task.complete!
      @task.make_incomplete!
      expect(@task.complete?).to eq(false)
    end
  end

  describe "update_content!" do
    it "updates the content" do
      @task.update_content!("New content")
      expect(@task.content).to eq("New content")
    end
  end

end




describe "Todo" do

  before(:each) do
  @todo = TodoList.new("Johannus")
  @todo.add_task("Buy potatoes")
  @todo.add_task("Sell potatoes")

  end

  describe "#add_task" do
    it "it adds task to list" do
      expect(@todo.tasks[0].content).to eq("Buy potatoes")
    end
  end


  describe "#delete_task" do
    it "it deletes a task from the list" do
      @todo.delete_task(1)
      task = @todo.tasks.find {|x| x.id==1}
      expect(task).to eq(nil)
    end
  end



  describe "#find_task_by_id" do
    it "find task by an id parameter" do
      task = @todo.find_task_by_id(11)
      expect(task.id).to eq(11)
    end
  end

  describe "#sort tasks by id" do
    it "sorts tasks by id" do
      @todo.sort_by_id

      expect(@todo.tasks[0].id < @todo.tasks[1].id).to eq(true)
    end
  end

  describe "#sort tasks by created date" do
    it "sorts tasks by created date" do
      @todo.sort_by_created

      expect(@todo.tasks[0].created_at < @todo.tasks[1].created_at).to eq(true)
    end
  end


  describe "#sort tasks by created date descending order" do
    it "sorts tasks by created date in descending order" do
      @todo.sort_by_created("desc")

      expect(@todo.tasks[0].created_at > @todo.tasks[1].created_at).to eq(true)
    end
  end

  describe "#load_file" do
    it "loads a file using YAML" do
      @todo_list = TodoList.new("Josh")
      @todo_list.load_tasks
      expect(@todo_list.tasks.length).to eq(3)
    end
  end

end
