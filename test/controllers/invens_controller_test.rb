require 'test_helper'

class InvensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inven = invens(:one)
  end

  test "should get index" do
    get invens_url
    assert_response :success
  end

  test "should get new" do
    get new_inven_url
    assert_response :success
  end

  test "should create inven" do
    assert_difference('Inven.count') do
      post invens_url, params: { inven: { location: @inven.location, name: @inven.name } }
    end

    assert_redirected_to inven_url(Inven.last)
  end

  test "should show inven" do
    get inven_url(@inven)
    assert_response :success
  end

  test "should get edit" do
    get edit_inven_url(@inven)
    assert_response :success
  end

  test "should update inven" do
    patch inven_url(@inven), params: { inven: { location: @inven.location, name: @inven.name } }
    assert_redirected_to inven_url(@inven)
  end

  test "should destroy inven" do
    assert_difference('Inven.count', -1) do
      delete inven_url(@inven)
    end

    assert_redirected_to invens_url
  end
end
