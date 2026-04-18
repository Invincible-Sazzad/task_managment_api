module Types
  class TaskPaginationType < Types::BaseObject
    field :tasks, [Types::TaskType], null: false
    field :page, Integer, null: false
    field :pages, Integer, null: false
    field :limit, Integer, null: false
    field :count, Integer, null: false
  end
end
