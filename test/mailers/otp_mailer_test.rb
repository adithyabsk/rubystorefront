require 'test_helper'

class OtpMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end
	#
  mail = ActionMailer::Base.deliveries.last
  assert_equal 'carlklier@outlook.com', mail['to'].to_s
end
