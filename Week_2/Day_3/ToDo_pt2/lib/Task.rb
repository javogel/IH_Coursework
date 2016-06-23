
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
