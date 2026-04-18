module Resolvers
  class TasksResolver < Resolvers::BaseResolver
    type Types::TaskPaginationType, null: false

    argument :status, Types::TaskStatusEnum, required: false
    argument :due_date_from, GraphQL::Types::ISO8601Date, required: false
    argument :due_date_to, GraphQL::Types::ISO8601Date, required: false
    argument :page, Integer, required: false, default_value: 1
    argument :limit, Integer, required: false, default_value: 20

    def resolve(page:, limit:, status: nil, due_date_from: nil, due_date_to: nil)
      user = authenticate_user!
      validate_filters!(due_date_from, due_date_to)

      scope = user.tasks
                .with_status(status)
                .due_from(due_date_from)
                .due_to(due_date_to)
                .order(id: :desc)

      offset = (page - 1) * limit

      tasks = scope.offset(offset).limit(limit)
      count = scope.count
      pages = (count.to_f / limit).ceil

      TaskPagination.new(
        tasks: tasks,
        page: page,
        pages: pages,
        limit: limit,
        count: count
      )
    end

    private

    def validate_filters!(from, to)
      return unless from && to && from > to

      raise GraphQL::ExecutionError, I18n.t("error_messages.task.invalid_due_date_range")
    end
  end
end
