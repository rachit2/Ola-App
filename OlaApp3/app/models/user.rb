class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # after_create :assign_role


 validates :name,:mobile,:address, presence: true
validates :mobile, numericality: { only_integer: true }, length: { is: 10 }
 has_and_belongs_to_many :roles
  has_one :driver_detail
  has_and_belongs_to_many :rides
  has_many :payment

  #user:-
  #id name email mobile address password 

  #ride:-
   #id user_id driver_id coupon_id distance pickup drop wait_time 


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # def assign_role
  #     byebug
  # end

end