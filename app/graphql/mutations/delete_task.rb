module Mutations
  class DeleteTask < Mutations::BaseMutation
    argument :id, ID, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(id:)
      user = authenticate_user!
      task = user.tasks.find_by(id: id)

      return {
        success: false,
        errors: [I18n.t("error_messages.task.not_found")]
      } unless task

      if task.destroy
        {
          success: true,
          errors: []
        }
      else
        {
          success: false,
          errors: task.errors.full_messages
        }
      end
    end
  end
end
