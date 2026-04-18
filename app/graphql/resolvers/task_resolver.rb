module Resolvers
  class TaskResolver < Resolvers::BaseResolver
    type Types::TaskType, null: true

    argument :id, ID, required: true

    def resolve(id:)
      user = authenticate_user!
      user.tasks.find_by(id: id)
    end
  end
end
