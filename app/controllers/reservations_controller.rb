class ReservationsController < ApplicationController
  @reservation = Reservation.new(reservation_params)
  if @reservation.save
    # ... (Handle successful creation)
  else
    # ... (Handle errors)
  end
end
