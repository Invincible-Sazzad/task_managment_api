module Types
  class TaskCreateInputType < Types::BaseInputObject
    argument :title, String, required: true
    argument :description, String, required: false
    argument :status, Types::TaskStatusEnum, required: false
    argument :due_date, GraphQL::Types::ISO8601DateTime, required: false
  end
end
