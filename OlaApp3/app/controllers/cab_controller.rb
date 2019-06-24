
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
      if @cab.update(cab_params)
      	  redirect_to [@cab,:index]
 
    end
end  

  def destroy
      if @cab.destroy

      else

      end
    end
  


  private
  def cab_params
    params.require(:cab).permit(:cab_type,:minimum_charge,:class_type)
  end

end