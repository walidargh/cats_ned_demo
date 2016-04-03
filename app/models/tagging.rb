class Tagging < ActiveRecord::Base
	belongs_to :cat
	belongs_to :tag

	validates :tag, :cat, presence: true
	validates :tag, uniqueness: {scope: :cat_id}
end
