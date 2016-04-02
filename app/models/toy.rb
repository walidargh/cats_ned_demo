class Toy < ActiveRecord::Base
	TYPES = ["string", "yarnball", "mouse"]

	validates :cat_id, :name, :type, presence: true
	validates :type, includsion: TYPES

	belongs_to: cat
end
