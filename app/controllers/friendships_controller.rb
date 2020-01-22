class FriendshipsController < ApplicationController
  def destroy
    @friendship = current_user.friendships.where(friend_id: params[:id]).first
    @friendship.destroy
    respond_to do |format|
    	flash[:notice] = "Friend was successfully removed"
    	format.html { redirect_to my_friends_path }
    	format.json { head :no_content }
   	end
  end 
end