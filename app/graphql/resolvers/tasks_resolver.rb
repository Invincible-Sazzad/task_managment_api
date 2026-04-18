module Resolvers
  class TasksResolver < Resolvers::BaseResolver
    type [Types::TaskType], null: false

    argument :status, Types::TaskStatusEnum, required: false
    argument :due_date_from, GraphQL::Types::ISO8601Date, required: false
    argument :due_date_to, GraphQL::Types::ISO8601Date, required: false

    def resolve(status: nil, due_date_from: nil, due_date_to: nil)
      user = authenticate_user!
      validate_filters!(due_date_from, due_date_to)

      user.tasks
        .with_status(status)
        .due_from(due_date_from)
        .due_to(due_date_to)
        .order(id: :desc)
    end

    private

    def validate_filters!(from, to)
      return unless from && to && from > to

      raise GraphQL::ExecutionError, I18n.t("error_messages.task.invalid_due_date_range")
    end
  end
end
