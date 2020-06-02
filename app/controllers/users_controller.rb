class UsersController < ApplicationController
  before_action :load_user, only: []
  before_action :user_params

    def new
      @user = User.new
    end

    def profile
      @user = current_user
    end

  private

    def load_user
      return @user = User.find(params[:id])
    end

    def user_params
      params.fetch(:user, {}).permit(:first_name, :last_name, :username, :email)
    end

end
