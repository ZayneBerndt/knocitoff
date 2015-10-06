class UsersController < ApplicationController

before_action :authenticate_user!, except: [:show]


 
 def show
 @user = User.find(params[:id])
 @item = @user.items
 @item = Item.new
 @user = current_user
 end

 private 

 def user_params 
  params.require (:user).permit (:name)
 end 
end



