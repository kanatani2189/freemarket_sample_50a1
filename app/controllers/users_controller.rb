class UsersController < ApplicationController
  # ユーザーのマイページ（お姉）
  def index
  end

  # マイページプロフィール画面（山本）
  def show
  end

  # 新規登録画面（西田）
  def new
  end

  # 本人確認ページ（石川）
  def edit
  end

  # ログアウト（内田）
  def logout
  end

  # マイページ出品一覧（内田）
  def items_show
    @user = User.find(current_user.id)
    @items = @user.items.all
  end

  # マイページ出品個別（内田）
  def item_show
    @user = User.find(current_user.id)
    @item = @user.items.find(params[:item_id])
  end
end
