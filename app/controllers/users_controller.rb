class UsersController < ApplicationController

before_action :authenticate_user!, except: [:show]


 
 def show
 @items = current_user.items
 @item = Item.new
 @user = current_user
 end

 private 

 def user_params 
  params.require (:user).permit (:name)
 end 
end



