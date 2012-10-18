class Note < ActiveRecord::Base
  attr_accessible :comment, :passage, :public, :user, :verse
  belongs_to :user 
  validates :user_id, :presence => true
end
