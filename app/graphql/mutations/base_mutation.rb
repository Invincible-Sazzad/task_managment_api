module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    private

    def authenticate_user!
      user = context[:current_user]
      raise GraphQL::ExecutionError, I18n.t("auth.unauthorized") unless user

      user
    end
  end
end
