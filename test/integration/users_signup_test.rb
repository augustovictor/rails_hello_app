require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    assert_no_difference 'User.count' do
      get signup_path
      post users_path, params: {
          user: {
              name: "",
              email: "user@invalid",
              password: "foo",
              password_confirmation: "bar"
          }
      }
    end
    assert_template 'users/new'
    assert_select 'div.alert-danger'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: {
          user: {
              name: "Victor Costa",
              email: "victoraweb@gmail.com",
              password: "12345mudar",
              password_confirmation: "12345mudar"
          }
      }
    end

    follow_redirect!
    assert_template 'users/show'
    assert_not flash.FILL_IN
  end

end