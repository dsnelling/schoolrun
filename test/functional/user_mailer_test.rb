require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "reset_password" do
    mail = UserMailer.password_reset(users(:bill))
    assert_equal "Password Reset", mail.subject
    assert_equal ["bill@here.com"], mail.to
    assert_equal ["schoolrun@dcafsnelling.co.uk"], mail.from
    assert_match "wYj6mtPQUFBH6JE4O6KT8w/edit", mail.body.encoded
  end

 # test "new_driver" do
 #   mail = UserMailer.new_driver
 #   assert_equal "New driver", mail.subject
 #   assert_equal ["to@example.org"], mail.to
 #   assert_equal ["from@example.com"], mail.from
 #   assert_match "Hi", mail.body.encoded
 # end

end
