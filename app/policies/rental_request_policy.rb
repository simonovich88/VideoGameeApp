class RentalRequestPolicy < ApplicationPolicy
  def create?
    true
  end

  def accept_request?
    user_is_owner_of_vhs?
  end

  def reject_request?
    user_is_owner_of_vhs?
  end

  def edit?
    user_is_owner_of_rental?
  end

  def history?
    true
  end
  
  class Scope < Scope
    def resolve
      scope.joins(:video_game).where("rental_requests.user_id = ? OR video_games.user_id = ?", user.id, user.id)
    end
  end

  private
  def user_is_owner_of_rental?
    record.user == user
  end

  def user_is_owner_of_vhs?
    record.video_game.user == user
  end
end
