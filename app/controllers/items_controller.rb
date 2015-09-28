class ItemsController < ApplicationController
  def create
    @user = current_user
    @new_item = Item.new 
    @item = current_user.items.build(item_params)
  end

  def destroy
    @item = Item.find(params[:id])
 end

 private 

 def item_params 
  params.require(:item).permit(:name)
end

end 