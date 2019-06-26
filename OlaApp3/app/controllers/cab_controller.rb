class CabController < ApplicationController
  def index
    @user=User.all
    @cab = Cab.all
  end
  def show
  end
  def new
    @cab = Cab.new
  end
  def edit
      @cab = Cab.find(params[:id])
  end
  def create
    @cab = Cab.new(cab_params)
    if @cab.minimum_charge.nil?
      @cab.minimum_charge=0
    end
    if @cab.save
        redirect_to [@cab,:index]
 
    end
  end

  def update
  @cab = Cab.find(params[:id])
 
  if @cab.update(cab_params)
    redirect_to @cab
  else
    render 'edit'
  end
end
private
  def cab_params
    params.require(:cab).permit(:cab_type, :minimum_charge,:class_type,:rate_per_km)
  end
  def destroy
 @cab = Cab.find(params[:id])
  @cab.destroy
 
  redirect_to cabs_path
end

  private
  def cab_params
    params.require(:cab).permit(:cab_type,:minimum_charge,:class_type)
  end
end