class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new(item_no_id: params[:item_no_id], start_date: params[:date])
    respond_to do |format|
      format.html { render partial: 'items/form', layout: false } # Render the form partial
      format.turbo_stream { render turbo_stream: turbo_stream.update('modal', partial: 'items/form') }
    end
  end
end
