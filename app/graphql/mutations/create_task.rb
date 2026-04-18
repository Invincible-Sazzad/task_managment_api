module Mutations
  class CreateTask < Mutations::BaseMutation
    argument :title, String, required: true
    argument :description, String, required: false
    argument :status, Types::TaskStatusEnum, required: false
    argument :due_date, GraphQL::Types::ISO8601DateTime, required: false

    field :task, Types::TaskType, null: true
    field :errors, [String], null: false

    def resolve(title:, description: nil, status: nil, due_date: nil)
      user = authenticate_user!
      new_task = user.tasks.new(title: title, description: description, status: status, due_date: due_date)

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
