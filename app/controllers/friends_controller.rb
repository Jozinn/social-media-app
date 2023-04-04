class FriendsController < ApplicationController
    def index
        @friends = current_user.friends
    end

    def show
        @friend = current_user.friends.find(params[:id])
    end
end
