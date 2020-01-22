class UserItemsController < ApplicationController
	def destroy
	    item = Item.find(params[:id])
	    @user_item = UserItem.where(user_id: current_user.id, item_id: item.id).first
	    @user_item.destroy
	    respond_to do |format|
	    	flash[:notice] = "Item was successfully UnSubscribed from portfolio"
	    	format.html { redirect_to my_portfolio_path }
	    	format.json { head :no_content }
   		end
  	end
	def create
	    item = Item.find_by_id(params[:item])
	    @user_item = UserItem.create(user: current_user, item: item)
	    respond_to do |format|
	    	flash[:success] = "Item #{@user_item.item.name} was successfully Subscribed"
	    	format.html { redirect_to my_portfolio_path }
	    	format.json { head :no_content }
   		end
  	end	
end