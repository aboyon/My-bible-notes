class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :about_me

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true, :on => :create

  has_many :notes, :dependent => :destroy

  before_save :sanitize_about_me

  def sanitize_about_me
  	@about_me = ActionView::Base.full_sanitizer.sanitize(@about_me)
  end
end
