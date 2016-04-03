class Tag < ActiveRecord::Base
	has_many :taggings, dependent: :destroy
	has_many :cats, through: :tags

	validates :name, presence: true
	validates :name, uniqueness: true
end
