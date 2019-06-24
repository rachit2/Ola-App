class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_and_belongs_to_many :roles
  has_one :driver_detail
  has_many :rides
  has_one :payment

  #user:-
  #id name email mobile address password 

  #ride:-
   #id user_id driver_id coupon_id distance pickup drop wait_time 


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



end
