# frozen_string_literal: true

# Controller for users
class UsersController < ResourcesController
  include ::Auth0::UserManagementConcern
  # Delete user data stored in DB, auth0, and clear session

  # def index; end
  # def new; raise Pundit::NotAuthorizedError; end
  # def create; raise Pundit::NotAuthorizedError; end
  # def show; raise Pundit::NotAuthorizedError; end
  # def edit; raise Pundit::NotAuthorizedError; end
  # def update; raise Pundit::NotAuthorizedError; end

  def destroy
    @user.destroy
    delete_auth0_user(@user.auth0_id)

    # clear session
    redirect_to logout_path
  end

  def lookup_params
    { auth0_id: current_user.uid }
  end

  def index_attributes
    [:id]
  end

  def show_attributes
    [:auth0_id]
  end
end
