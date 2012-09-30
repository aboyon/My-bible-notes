class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true, :on => :create

  has_many :notes, :dependent => :destroy
end
