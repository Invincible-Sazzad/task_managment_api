module Resolvers
  class TaskResolver < Resolvers::BaseResolver
    type Types::TaskType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      Task.find(id)
    rescue ActiveRecord::RecordNotFound
      raise GraphQL::ExecutionError, "Task with id #{id} not found"
    end
  end
end
