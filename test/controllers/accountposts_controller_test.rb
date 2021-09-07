require "test_helper"

class AccountpostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accountpost = accountposts(:one)
  end

  test "should get index" do
    get accountposts_url
    assert_response :success
  end

  test "should get new" do
    get new_accountpost_url
    assert_response :success
  end

  test "should create accountpost" do
    assert_difference('Accountpost.count') do
      post accountposts_url, params: { accountpost: {  } }
    end

    assert_redirected_to accountpost_url(Accountpost.last)
  end

  test "should show accountpost" do
    get accountpost_url(@accountpost)
    assert_response :success
  end

  test "should get edit" do
    get edit_accountpost_url(@accountpost)
    assert_response :success
  end

  test "should update accountpost" do
    patch accountpost_url(@accountpost), params: { accountpost: {  } }
    assert_redirected_to accountpost_url(@accountpost)
  end

  test "should destroy accountpost" do
    assert_difference('Accountpost.count', -1) do
      delete accountpost_url(@accountpost)
    end

    assert_redirected_to accountposts_url
  end
end
