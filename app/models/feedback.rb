class Feedback < ApplicationRecord
	validates :text, presence: true
end
