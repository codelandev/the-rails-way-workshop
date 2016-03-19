class MainController < ApplicationController
  def index
    render 'home'
  end

  def home
    render 'public'
  end

  def login
    email = params[:email]
    pass = params[:password]
    @user = User.find_by(email: email, password: pass)

    if @user
      redirect_to :home
    else
      redirect_to :root
    end
  end

  def create_account
    email = params[:email]
    pass = params[:password]
    pass2 = params[:password2]

    if User.find_by(email: email) || pass != pass2
      return redirect_to :root
    end

    @user = User.create(email: email, password: pass)
    redirect_to :home
  end

  def logout
    redirect_to :root
  end
end