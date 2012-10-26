class Note < ActiveRecord::Base
  attr_accessible :comment, :passage, :public, :user, :verse
  belongs_to :user 
  validates :user_id, :presence => true
  before_save :sanitize_verse

  def sanitize_verse
  	@verse =ActionView::Base.full_sanitizer.sanitize(@verse, :tags => %w('sup'))
  end

end
