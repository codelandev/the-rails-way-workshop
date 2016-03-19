class MainController < ApplicationController
  def index
    if session[:user_id]
      redirect_to action: :public
    else
      render 'home'
    end
  end

  def public
    @todos_tweets = Tweet.all.order('created_at DESC')
  end

  def login
    email = params[:email]
    pass = params[:password]

    usuario = User.find_by(username: email, password: pass)
    if usuario
      session[:user_id] = usuario.id
      redirect_to action: :public
    else
      redirect_to action: :index
    end
  end

  def sign_up
    email = params[:email]
    pass = params[:password]
    pass2 = params[:password2]

    usuario = User.find_by(username: email)
    if usuario.nil? && pass == pass2 && pass.present?
      usuario = User.create(username: email, password: pass, active: false)
      session[:user_id] = usuario.id
      redirect_to action: :public
    else
      redirect_to action: :index
    end
  end

  def logout
    session.destroy
    redirect_to action: :index
  end
end