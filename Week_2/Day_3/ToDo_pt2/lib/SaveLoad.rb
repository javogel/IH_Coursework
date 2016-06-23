

module SaveLoad

  def save
    @todo_store.transaction do
      @todo_store[@user] = @tasks
    end
  end

  def load_tasks
    @loaded = YAML.load_file("./public/tasks.yml")
    @tasks = @loaded["Josh"]

  end

end
