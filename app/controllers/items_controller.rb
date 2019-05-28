class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy]

  # トップページ（内田）
  def index
    @items = Item.all
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
  end

  def update
    @item.images.detach
    if @item.update(update_item_params)
      redirect_to root_path
    else
      redirect_to new_card_path
    end
  end

  # def upload_image
  #   @image_blob = create_blob(params[:image])
  #   respond_to do |format|
  #     format.json { @image_blob.id }
  #   end
  # end

  def destroy
    if @item.destroy
      redirect_to items_path
    else
      redirect_to  item_path
    end
  end

#  商品購入確認ページ（石川）
  def buy
  end

#  商品検索後ページ（山本）
  def search
    @items = Item.where("name LIKE(?)", "%#{params[:keyword]}%").order("created_at DESC").page(params[:page]).per(8)
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :condition, :size, :shipping_burden, :shipping_method, :estimated_date, :prefecture_id, :brand_id, {:user_ids => []}, images: [], parent_categories_attributes: [:large, :midium, :small, :item_id])
  end

  # def uploaded_images
  #   params[:item][:images].map{|id| ActiveStorage::Blob.find(id)} if params[:item][:images]
  # end

  def update_item_params
    params.require(:item).permit(:name, :description, :price, :condition, :size, :shipping_burden, :shipping_method, :estimated_date, :prefecture_id, :brand_id, {:user_ids => []}, images: [], parent_categories_attributes: [:large, :midium, :small, :item_id, :_destroy, :id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # def create_blob(uploading_file)
  #   ActiveStorage::Blob.create_after_upload! \
  #     io: uploading_file.open,
  #     filename: uploading_file.original_filename,
  #     content_type: uploading_file.content_type
  # end

end
