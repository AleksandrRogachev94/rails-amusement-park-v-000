class RidesController < ApplicationController

  def new
    ride = Ride.create(user: current_user, attraction_id: params[:attraction_id])
    msg = ride.take_ride
    redirect_to user_path(current_user), notice: msg
    # msg =
    # redirect_to
  end

end
