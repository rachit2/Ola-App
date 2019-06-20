class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_and_belongs_to_many :Role
  has_one :DriverDetail
  has_many :Ride

  #user:-
  #id name email mobile address password 

  #ride:-
   #id user_id driver_id coupon_id distance pickup drop wait_time 


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



end
