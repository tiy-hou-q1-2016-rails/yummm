class Recipe < ActiveRecord::Base

  validates :name, :description, :ingredients, :method, :photo_url, presence: true
end
