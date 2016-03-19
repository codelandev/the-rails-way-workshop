class TweetsController < ApplicationController

  def create
    texto = params[:text]
    id_usuario = session[:user_id]

    tweet = Tweet.new(text: texto, user_id: id_usuario)
    if tweet.is_it_valid?
      tweet.save
    else
      flash[:error] = 'Vish!'
    end
    redirect_to controller: :main, action: :public
  end

end