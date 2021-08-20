class ApiController < InheritedResources::Base
    include ActionController::HttpAuthentication::Basic::ControllerMethods
    http_basic_authenticate_with name: "user", password: "pass", :except => ["news", "video_game_filter"]
    protect_from_forgery with: :null_session 
    require 'json'
  
  
    def video_game_filter

        start_time = Date.parse(params[:fecha1])    
        end_time = Date.parse(params[:fecha2])       
        @video_games  = VideoGame.date_filter(start_time, end_time+1)
        @filter_api = []
        @@video_games .each do |video_game|

        @video_game_hash = {"id" => video_game.id}
        @video_game_hash.merge!("title"=> video_game.title)
        @video_game_hash.merge!("year"=> video_game.year)
        @video_game_hash.merge!("description"=> video_game.description)
        @video_game_hash.merge!("price"=> video_game.price)
        @video_game_hash.merge!("user_id"=> video_game.user_id)
    
        @filter_api << (@video_game_hash)
      end
      render :json => @filter_api
    end
  
    def news
      @video_games = VideoGame.last(50)
      @users = User.all
      @video_game_api = []
      
      @video_games.each do |video_game|
      
        @video_game_hash = {"id" => video_game.id}
        @video_game_hash.merge!("title"=> video_game.title)
        @video_game_hash.merge!("year"=> video_game.year)
        @video_game_hash.merge!("description"=> video_game.description)
        @video_game_hash.merge!("price"=> video_game.price)
        @video_game_hash.merge!("user_id"=> video_game.user_id)

        @video_game_api<< (@video_game_hash)
  
  
      end
      @final_api_video_game = @video_game_api.last(50)
      render :json => @final_api_video_game
     
    end
  
    respond_to do |format|
      format.html { render "api/new", :layout => false  }
  
    end
  
    def create
      @video_game = VideoGame.create!(video_game_params)
      @video_game.save
      render json: @video_game
    end
      
  
    private
  
    def api_params
      params.require(:api).permit(:fecha1, :fecha2)
    end
  
    
    def video_game_params
      params.require(:video_game).permit( :title, :year,
        :description, :price, :user_id)
    end
  
  end