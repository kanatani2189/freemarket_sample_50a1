class ItemsController < ApplicationController
  # トップページ（内田）
  def index
  end

 # 商品詳細ページ（山本）
  def show
  end

 # 商品出品ページ（西田）
  def new
    @item = Item.new
    @image = @item.images.build
  end
  
  def create
    @item = Item.new(item_params)   
    if @item.save
      redirect_to root_path
    else
      redirect_to new_card_path
    end
  end

 # 商品出品編集機能を追加する予定
  def edit
  end

#  商品購入確認ページ（石川）
  def buy
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :condition, :size, :shipping_burden, :shipping_method, :estimated_date, :prefecture_id, :brand_id, images_attributes: [:name, :user_id, :item_id])
  end

end