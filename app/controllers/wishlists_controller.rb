class WishlistsController < ApplicationController
  before_action :authenticate_user!

  def index
    wishlists_policy = policy_scope(Wishlist)
    @wishlists = wishlists_policy.where(user_id: current_user.id)
    @video_ids = @wishlists.map{ |video_id|
      VideoGame.find(video_id.video_game_id)
    }

  @query = Wishlist.joins(:video_game).group(:title).count
 

  end

  # Form to add a Videogame to wishlist will be on the Videos Show page
  def create
    @wishlist = Wishlist.new
    @wishlist.user = current_user
    @wishlist.video_game_id = params[:video_game_id]

    skip_authorization
    
    @wishlist.save
    redirect_to video_game_path(params[:video_game_id])
  end

  def destroy
    @wishlist = Wishlist.find(params[:id])
    redirect_to video_game_path(@wishlist.video_game)

    authorize @wishlist
    @wishlist.destroy
  end
end
