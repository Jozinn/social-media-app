class UsersController < ApplicationController
    def index
        @users = Users.all
        @invitations = Invitation.where(invited_user_id: current_user.id)
    end

    def show
        @user = Users.find(params[:id])
    end
end
