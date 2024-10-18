class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new(item_no_id: params[:item_no_id], start_date: params[:date])
    render partial: 'items/form' # Render the form partial
  end
end
