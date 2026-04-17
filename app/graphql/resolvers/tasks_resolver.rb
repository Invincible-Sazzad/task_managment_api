module Resolvers
  class TasksResolver < Resolvers::BaseResolver
    type [Types::TaskType], null: false

    argument :status, Types::TaskStatusEnum, required: false
    argument :due_date_from, GraphQL::Types::ISO8601Date, required: false
    argument :due_date_to, GraphQL::Types::ISO8601Date, required: false

    def resolve(status: nil, due_date_from: nil, due_date_to: nil)
      validate_filters!(due_date_from, due_date_to)

      Task
        .with_status(status)
        .due_from(due_date_from)
        .due_to(due_date_to)
        .order(id: :desc)
    end

    private

    def validate_filters!(from, to)
      return unless from && to && from > to

      raise GraphQL::ExecutionError, "Invalid due_date range: from > to"
    end
  end
end
