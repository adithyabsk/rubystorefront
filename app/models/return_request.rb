class ReturnRequest < Request
	belongs_to :user
	belongs_to :item
	validates :date, presence: true, :timeliness => {:on_or_before => lambda { Date.current }, :type => :date}
end
