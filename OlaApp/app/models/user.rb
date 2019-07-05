# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # after_create :assign_role
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :roles
  has_one :cab_detail
  has_many :rides
  
  belongs_to :city

  validates :name, :mobile, :address, :city, presence: true
  validates :mobile, numericality: { only_integer: true }, length: { is: 10 }
end
