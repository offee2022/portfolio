class GamesController < ApplicationController
  def index
    @games = Game.all
    @user = current_user
  end

  def new
    @game = Game.new
    @user = current_user
  end

  def create
    if user_signed_in?
      @game = Game.new(game_params)
      @game.user_id = current_user.id
      if @game.save
        redirect_to games_path, notice: "無事に投稿できました。"
      else
        render :new
      end
    end
  end

  def show
    @game = Game.find(params[:id])
    @user = current_user
  end

  def edit
    @game = Game.find(params[:id])
    @user = current_user
    if @game.user == current_user
      render :edit
    else
      redirect_to game_path(@game.id)
    end
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to games_path, notice: "無事に更新できました。"
    else
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path, notice: "投稿を削除しました。"
  end

  private
  def game_params
    params.require(:game).permit(:title, :body, :image)
  end

end
