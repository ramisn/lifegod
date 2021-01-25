require 'test_helper'

class TestpagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @testpage = testpages(:one)
  end

  test "should get index" do
    get testpages_url
    assert_response :success
  end

  test "should get new" do
    get new_testpage_url
    assert_response :success
  end

  test "should create testpage" do
    assert_difference('Testpage.count') do
      post testpages_url, params: { testpage: { name: @testpage.name, place: @testpage.place } }
    end

    assert_redirected_to testpage_url(Testpage.last)
  end

  test "should show testpage" do
    get testpage_url(@testpage)
    assert_response :success
  end

  test "should get edit" do
    get edit_testpage_url(@testpage)
    assert_response :success
  end

  test "should update testpage" do
    patch testpage_url(@testpage), params: { testpage: { name: @testpage.name, place: @testpage.place } }
    assert_redirected_to testpage_url(@testpage)
  end

  test "should destroy testpage" do
    assert_difference('Testpage.count', -1) do
      delete testpage_url(@testpage)
    end

    assert_redirected_to testpages_url
  end
end
