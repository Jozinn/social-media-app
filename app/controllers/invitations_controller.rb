class InvitationsController < ApplicationController
    def index
        @invitations = Invitation.where(invited_user: current_user.id)
    end
    
    def invite
        @invitation = Invitation.new(accepted: false, inviting_user: current_user.id, invited_user: params[:id])
        if @invitation.save
            redirect_to root_path
        else
            render root_path, status: :unprocessable_entity
        end
    end

    def accept
        @user = current_user
        @invitation = Invitation.find(params[:id])
        @inviting_user = User.find(@invitation.inviting_user)
        @user.friends << @inviting_user
        @invitation.destroy
    end

    def destroy
        @invitation = Invitation.find(params[:id])
        @invitation.destroy
    end
end
