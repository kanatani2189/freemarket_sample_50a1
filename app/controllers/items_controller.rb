class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy]
  before_action :card_get, only: [:buy]

  # トップページ（内田）
  def index

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
    @item = Item.find(params[:id])
  end

  def update
    if params[:item][:images]
      @item.images.detach
    end
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

#  商品購入確認ページ
  def buy
    @item = Item.find(params[:item_id])
  end

#  商品検索後ページ（山本）
  def search
    @items = Item.where("name LIKE(?)", "%#{params[:keyword]}%").order("created_at DESC").page(params[:page]).per(8)
    @q = Item.ransack(params[:q])
    @item = @q.result(distinct: true)
  end

  def search_item
    @q = Item.search(params[:q])
    @item = @q.result(distinct: true).order("created_at DESC").page(params[:page]).per(8)
  end
  
  # category-page "items/category/123" (石川)
  def category
    @items = Item.all
    @aaa = params[:date].to_i
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
  
  def card_get
    @card = Card.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if @card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
      # 《＋α》 登録しているカード会社のブランドアイコンを表示するためのコードです。---------
      @card_brand = @default_card_information.brand
      case @card_brand
      when "Visa"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/visa.svg?21530554"
      when "JCB"
        @card_src = "jcb.svg"
      when "MasterCard"
        @card_src = "master-card.svg"
      when "American Express"
        @card_src = "american_express.svg"
      when "Diners Club"
        @card_src = "dinersclub.svg"
      when "Discover"
        @card_src = "discover.svg"
      end
    end
  end
  
  # def create_blob(uploading_file)
  #   ActiveStorage::Blob.create_after_upload! \
  #     io: uploading_file.open,
  #     filename: uploading_file.original_filename,
  #     content_type: uploading_file.content_type
  # end

  # def search_params
  #   params.require(:q).permit(:price_gteq,:name_cont)
  # end

end
