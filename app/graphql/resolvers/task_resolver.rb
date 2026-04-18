module Resolvers
  class TaskResolver < Resolvers::BaseResolver
    type Types::TaskType, null: true

    argument :id, ID, required: true

    def resolve(id:)
      Task.find_by(id: id)
    end
  end
end
