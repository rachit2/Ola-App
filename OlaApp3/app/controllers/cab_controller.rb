class CabController < ApplicationController

  def index
    @user=User.all
    @cab = Cab.all
    @search_term='rajwada'
    @cabs=Cab.for(@search_term)
  end

  def show
  end

  def new
    
  end

  def edit

  end

  def create
 
  end

  def update
 
end

private
  def cab_params
      end

  def destroy
 
  end
end
