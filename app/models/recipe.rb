class Recipe < ActiveRecord::Base
  attachment :photo
  validates :name, :description, :ingredients, :method, :photo, presence: true
end
