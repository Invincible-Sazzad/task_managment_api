class Users::RegistrationsController < Devise::RegistrationsController
  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        message: I18n.t("auth.signup.success"),
        user: {
          id: resource.id,
          email: resource.email
        }
      }, status: :ok
    else
      render json: {
        message: I18n.t("auth.signup.failure"),
        errors: resource.errors.full_messages
      }, status: :unprocessable_entity
    end
  end
end
