class RentalRequestsController < ApplicationController
  before_action :authenticate_user!

  def index
    # How to do policy_scope on @outgoing_rental_requests?
    rental_requests = policy_scope(RentalRequest)

    @outgoing_rental_requests = rental_requests.select do |request|
      request.user == current_user && request.status == "Pending"
    end
    
    @incoming_rental_requests = rental_requests.select do |request|
      request.video_game.user == current_user && request.status == "Pending"
    end

    @query = RentalRequest.joins(:video_game).group(:status).count
    
  end

  # Form to create new request will be embedded on Videos Show

  def create
    @rental_request = RentalRequest.new(rental_request_params)
    @rental_request.user = current_user

    authorize @rental_request

    @rental_request.save
    flash.notice = "Request Submitted!"

    redirect_to video_game_path(@rental_request.video_game_id)
  end

  # Buttons tick/cross on rental_request#index
  def accept_request
    @rental_request = RentalRequest.find(params[:id])
    @rental_request.status = "Accepted"

    authorize @rental_request

    @rental_request.save
    flash.notice = "Accepted request!"

    redirect_to rental_requests_path
  end

  def reject_request
    @rental_request = RentalRequest.find(params[:id])
    @rental_request.status = "Rejected"

    authorize @rental_request
    @rental_request.save
    
    flash.notice = "Rejected request!"

    redirect_to rental_requests_path
  end

  def history


    
  end

  private

  def rental_request_params
    params.require(:rental_request).permit(:message, :start_date, :end_date, :video_game_id)
  end
end
