class SessionsController < ApplicationController
  def nnew
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
       flash[:success] = 'ﾛｸﾞｲﾝに成功しました。'
       redirect_to @user
    else
       flash.now[:danger] = 'ﾛｸﾞｲﾝに失敗しました。'
       render 'new'
  end
end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_path
  end
  
  private
  
  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      #ﾛｸﾞｲﾝ成功
      session[:user_id] = @user.id
      return true
    else
      #ﾛｸﾞｲﾝ失敗
      return false
    end
  end  
end
