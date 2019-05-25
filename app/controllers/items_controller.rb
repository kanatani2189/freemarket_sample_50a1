class ItemsController < ApplicationController
  # トップページ（内田）
  def index
    @item = Item.last(4)
  end

 # 商品詳細ページ（山本）
  def show
    @item = Item.find(params[:id])
  end

 # 商品出品ページ（西田）
  def new
    @item = Item.new
    @item.users << current_user
    @item.parent_categories.build
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      UserItem.create(user_id: current_user.id, item_id: @item.id)
      redirect_to root_path
    else
      redirect_to new_card_path
    end
  end

 # 商品出品編集機能
  def edit
    set_item
  end

  def update
    set_item
    @item.images.detach
    if @item.update(update_item_params)
      redirect_to root_path
    else
      redirect_to new_card_path
    end
  end

#  商品購入確認ページ（石川）
  def buy
  end

#  商品検索後ページ（山本）
  def search
    @items = Item.where("name LIKE(?)", "%#{params[:keyword]}%").limit(8)
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :condition, :size, :shipping_burden, :shipping_method, :estimated_date, :prefecture_id, :brand_id, {:user_ids => []}, images: [], parent_categories_attributes: [:large, :midium, :small, :item_id])
  end

  def update_item_params
    params.require(:item).permit(:name, :description, :price, :condition, :size, :shipping_burden, :shipping_method, :estimated_date, :prefecture_id, :brand_id, {:user_ids => []}, images: [], parent_categories_attributes: [:large, :midium, :small, :item_id, :_destroy, :id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
