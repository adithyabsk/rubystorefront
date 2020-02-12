class RestrictedRequest < Request
	belongs_to :user
	belongs_to :item
end
