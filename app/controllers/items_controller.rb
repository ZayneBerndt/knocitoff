class ItemsController < ApplicationController
 
  def new 
    @item = @Item.new 
  end 


  def create
    @user = current_user
    @item = current_user.items.build(params[:id])
    if @item.save 
      flash[:notice] = "Item created succesfully"
      
    else 
      flash[:error] = "Something went wrong. Please try again."
        render :new # Draws new action again. 
  end
end 


  def destroy
    @item = Item.find(params[:id])
    if @item.destroy 
      flash[:notice] =  "\"#{@item.name}\" was deleted succesfully."
      
    else 
      flash[:error] = "There was an error deleting your item"
        render :show
    end 
  end 


 def show 

 end 


 def edit 
 end 

  def update
    #load message from params 
    if @item.update_attributes(message_params)
      #load flash 
      #redirect message 
    else 
      #load flash 
      #render action we came from 
    end 
  end 

 private 

 def item_params 
  params.require(:item).permit(:name)
 end
end 