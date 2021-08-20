class VideoGamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @pg_search_documents = VideoGame.search_by_title(params[:query])
    @video_games = policy_scope(VideoGame)
    @video_game = VideoGame.new  #<!-- fech --->

    @query = RentalRequest.joins(:video_game).group(:status).count
    @query2 = VideoGame.group(:title).count
     
    # end
  end

  def show
    @video_game = VideoGame.find(params[:id])
    @rental_request = RentalRequest.new
    @user_wishlist = @video_game.wishlists.find_by(user: current_user)
    
    skip_authorization
    skip_policy_scope
  end

  def new
    @video_game = VideoGame.new

    authorize @video_game
  end

  def create
    @video_game = VideoGame.new(video_games_params)
    @video_game.user = current_user
    authorize @video_game

    respond_to do |format|
      if @video_game.save
        format.html { redirect_to @video_game, notice: "Game Added!" }
        format.json { render :show, status: :created, location: @video_game }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @video_game.errors, status: :unprocessable_entity }
      end
    end


    
  end

  def edit
    @video_game = VideoGame.find(params[:id])

    authorize @video_game
  end

  def update
    @video_game = VideoGame.find(params[:id])
    @video_game.user = current_user
    authorize @video_game

    if @video_game.update(video_games_params)
      redirect_to video_game_path(@video_game)
    else
      render "edit"
    end
  end

  def destroy
    @video_game = VideoGame.find(params[:id])

    authorize @video_game

    rental_request = RentalRequest.where(video_game_id: @video_game.id)
    if rental_request.exists?
      flash.alert = "Rental requests exist! Cannot be deleted!"
      redirect_to video_game_path(@video_game)
    else
      wishlists = Wishlist.where(video_game_id: @video_game.id)
      wishlists.each do |wish|
        wish.destroy
      end
      @video_game.destroy
      flash.notice = "Your listing has been deleted!"
      redirect_to video_games_path
    end

  end

  private

  def video_games_params
    params.require(:video_game).permit(:title, :year, :cover_photo,
                                           :description, :price)
  end
end
