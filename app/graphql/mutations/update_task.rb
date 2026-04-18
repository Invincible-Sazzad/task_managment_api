module Mutations
  class UpdateTask < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false
    argument :status, Types::TaskStatusEnum, required: false
    argument :due_date, GraphQL::Types::ISO8601DateTime, required: false

    field :task, Types::TaskType, null: true
    field :errors, [String], null: false

    def resolve(id:, **args)
      existing_task = Task.find_by(id: id)

      return {
        task: nil,
        errors: ["Task not found"]
      } unless existing_task

      update_attrs = args.compact

      if existing_task.update(update_attrs)
        {
          task: existing_task,
          errors: []
        }
      else
        {
          task: nil,
          errors: existing_task.errors.full_messages
        }
      end
    end
  end
end
