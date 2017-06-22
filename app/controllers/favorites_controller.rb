class FavoritesController < ApplicationController
  #favoriteテーブルにデータを保存
   def create
      @favorite = current_user.favorites.find_or_create_by(micropost_id: params[:micropost_id])
      flash[:success] = 'お気に入りに登録しました。'
      redirect_to root_url
  end
  
  #current_userとfind_byメソッドを使い削除するお気に入りのデータをデーブルから取得し、destroyメソッドでそのデータを削除
  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to root_url
    end
  end
  
  
end
