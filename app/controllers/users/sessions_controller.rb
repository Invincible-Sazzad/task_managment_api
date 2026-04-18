class Users::SessionsController < Devise::SessionsController
  skip_before_action :require_no_authentication, only: [:create]
  skip_before_action :verify_signed_out_user, only: [:destroy]

  def create
    self.resource = warden.authenticate(auth_options)

    if resource
      sign_in(resource_name, resource)
      render json: {
        message: I18n.t("auth.login.success"),
        user: {
          id: resource.id,
          email: resource.email
        }
      }, status: :ok
    else
      render json: {
        message: I18n.t("auth.login.failure"),
        errors: [I18n.t("auth.login.failure")]
      }, status: :unauthorized
    end
  end

  def destroy
    if current_user
      sign_out(current_user)
      render json: { message: I18n.t("auth.logout.success") }, status: :ok
    else
      render json: {
        message: I18n.t("auth.logout.failure"),
        errors: [I18n.t("auth.logout.failure")]
      }, status: :unauthorized
    end
  end
end
