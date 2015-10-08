class ItemsController < ApplicationController
 
  def new 
    @item = Item.new 
  end 


  def create
    @item = current_user.items.build(item_params)
    @new_item = Item.new
  if @item.save 
    flash[:notice] = "Item created succesfully"
  
  else 
     flash[:error] = "Something went wrong. Please try again."
     render :new # Draws new action again. 
  end
       respond_to do |format|
       format.html
       format.js
     end
end 
 

 def destroy
  @user = current_user
    @item = Item.find(params[:id])
    
  if @item.destroy 
    flash[:notice] =  "\"#{@item.name}\" was deleted succesfully."
  else 
    flash[:error] = "There was an error deleting your item"
    end 

     respond_to do |format|
       format.html
       format.js
     end
  end 


 def show 

 end 

 def edit 
 end 

  def update
   
  end 

 private 

 def item_params 
  params.require(:item).permit(:name)
 end
end 