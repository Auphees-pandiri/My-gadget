class ItemsController < ApplicationController
	def search
		if params[:search_param].blank?
			flash.now[:danger] = "You have entered an empty search string"
		else
			@items = Item.search(params[:search_param])
			flash.now[:danger] = "No items match this search criteria" if @items.blank?
		end
		respond_to do |format|
			format.js { render partial: 'items/result' }
		end
	end
	def destroy
	    @item = current_user.items.where(friend_id: params[:id]).first
	    @friendship.destroy
	    flash[:notice] = "Friend was successfully removed"
	    redirect_to my_friends_path
  	end 
end