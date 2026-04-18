module Mutations
  class CreateTask < BaseMutation
    argument :task, Types::TaskCreateInputType, required: true

    field :task, Types::TaskType, null: true
    field :errors, [String], null: false

    def resolve(task:)
      new_task = Task.new(task.to_h)

      if new_task.save
        {
          task: new_task,
          errors: []
        }
      else
        {
          task: nil,
          errors: new_task.errors.full_messages
        }
      end
    end
  end
end
