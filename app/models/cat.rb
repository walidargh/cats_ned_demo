class Cat < ActiveRecord::Base
	COAT_COLORS = %w(Black Calico Tabby)
	validates :name, :skill, :coat_color, :description, presence: true
	validates :coat_color, inclusion: COAT_COLORS

	has_many :toys
	has_many :taggings, dependent: :destroy, inverse_of: :cat
	has_many :tags, through: :taggings
	# Cat#tags
	# Cat#tag_ids
	# Cat#tag_ids=
	# * Creates/Destroys records in a join table
	# * new_tags = [1, 2, 3]
	# * markov.tag_ids = (new_tags)
	# * First it queries markov.tag_ids to get all of markov's tag_ids
	# * Any ids in new_tags not in markov.tag_ids yet, it builds and saves a new
	# 	tagging object with cat_id: markov.id, tag_id: new_tag_id.
	# * Any ids which are not in new_tags will have their tagging destroyed

	# def my_tag_ids(new_tag_ids)
	# 	old_tag_ids = self.tag_ids
	# 	tags_to_destroy = old_tag_ids - new_tag_ids
	# 	tags_to_create = new_tag_ids - old_tag_ids
	#
	# transaction ensures that the process doesn't complete unless everything
	# goes right
	# 	ActiveRecord::Base.transaction do
	# 		Tagging.where(cat_id: self.id, tag_id: tags_to_destroy).destroy
	# 		tags_to_create.each do |tag_id|
	# 			Tagging.create!(cat_id: self.id, tag_id: tag_id )
	# 		end
	# 	end
	# end
	#
end
