class UsersController < ApplicationController

before_action :authenticate_user!, except: [:show]

 def create 
  @user = User.new (user_params)

  if @user.save 
    flash [:notice] = 'Account created'
    redirect_to root_url
  else
    render :new 
 end 
end 
 
 def show
 @user = User.find(params[:id])
 @item = @user.items
 @item = Item.new
 @user = current_user
 end

 private 

 def user_params 
  params.require (:user).permit (:name, :email, :password, :password_confirm)
 end 
end



