class Favorite < ApplicationRecord

	belongs_to :user
	belongs_to :recipe
	has_many :records, :as => :recordable

	enum status: { cooked: 0, favorite: 1, not_favorite: 2 }
	validates :status, inclusion: { in: Favorite.statuses.keys }
	
	class << self
	def localed_statuses
		statuses.keys.map do |s|
			[ApplicationController.helpers.t("status.favorite.#{s}"), s]
		end
	end
	end
	
end
