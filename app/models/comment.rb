class Comment < ActiveRecord::Base
  belongs_to :recipe
  validates :recipe, :comment_text, presence: true
end
