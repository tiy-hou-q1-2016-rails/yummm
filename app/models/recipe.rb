class Recipe < ActiveRecord::Base
  attachment :photo
  validates :name, :description, :ingredients, :method, :category, presence: true

  belongs_to :category
  has_many :comments

  # if we wanted to push down to model, we could call
  #    @recipe.increment_view_count!
  #
  # def increment_view_count!
  #   new_count = view_count + 1
  #   update_attribute(:view_count, new_count)
  # end
end
