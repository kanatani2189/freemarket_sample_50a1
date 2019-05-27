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
    @item = User.item..find(params[:id])
  end
end
