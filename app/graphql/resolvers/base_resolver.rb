module Resolvers
  class BaseResolver < GraphQL::Schema::Resolver
    def authenticate_user!
      user = context[:current_user]
      raise GraphQL::ExecutionError, I18n.t("auth.unauthorized") unless user

      user
    end
  end
end
