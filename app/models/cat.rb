class Cat < ActiveRecord::Base
	COAT_COLORS = %w(Black Calico Tabby)
	validates :name, :skill, :coat_color, :description, presence: true
	validates :coat_color, inclusion: COAT_COLORS

	has_many :toys

end
