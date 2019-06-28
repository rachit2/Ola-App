# frozen_string_literal: true

class DriversController < ApplicationController
  def index; end

  def new; end

  def show; end

  def edit; end

  def ride_request
    @customer = User.all.select { |m| m.role_ids == [2] }.last
   end
end
