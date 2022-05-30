class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :relations, :dependent => :destroy
  has_many :friends, :through => :relations, :source => :user

  has_many :expense_details, :dependent => :destroy
  has_many :expenses, :through => :expense_details
end
