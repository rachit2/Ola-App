# frozen_string_literal: true

class PaymentController < ApplicationController
  def index
		@fare=params[:fare]
   end

  def new
    @payment = Payment.new
  end
  
  def create
    ride=current_user.rides.last
		@payment = ride.build_payment
    @payment.payment_status = 'Done'
    @payment.total_amount = params[:fare]
		redirect_to action: 'show', id: current_user.id if @payment.save
  end

  def show; end
end