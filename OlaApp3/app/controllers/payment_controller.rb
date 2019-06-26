class PaymentController < ApplicationController
def index

end

def new
	@payment=Payment.new
end

def create
 	@user=current_user
 	@ride=Ride.last
 	byebug
 	@payment=@user.payment.build(pay_params)

 		
 	# if(@ride.distance==0)

    #  if @ride.save
    # redirect_to :action => "show", :id => current_user.id, :fare=>@fare
    # render :show , locals: {:id=>current_user.id, :fare=>@fare}
    #  end

end

private
  def pay_params
    params.require(:payment).permit(:card_number)
 	end



def show
end
end