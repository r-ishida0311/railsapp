class ReservationsController < ApplicationController
  def new
  @reservation = Reservation.new(reservation_params)

end
