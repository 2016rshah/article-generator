class Article < ActiveRecord::Base
	validates :title, uniqueness: true
end
