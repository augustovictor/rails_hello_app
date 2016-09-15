require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:victor)
    @otherUser = users(:bruno)
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@otherUser)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@otherUser)
    patch user_path(@user), params: {
        user: {
            name: @user.name,
            email: @user.email
        }
    }

    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end

  test "should not allow the admin attribute to be edited via the web" do
    log_in_as(@otherUser)
    assert_not @otherUser.admin?
    patch user_path(@otherUser), params: {
        user: {
            password: @otherUser.password,
            password_confirmation: @otherUser.password,
            admin: true
        }
    }

    assert_not @otherUser.reload.admin?
  end

end
