class Post < ActiveRecord::Base

	belongs_to :user

	validates :title, presence: true
	validates :image, presence: true
end
