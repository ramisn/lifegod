require 'test_helper'

class CollectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collection = collections(:one)
  end

  test "should get index" do
    get collections_url
    assert_response :success
  end

  test "should get new" do
    get new_collection_url
    assert_response :success
  end

  test "should create collection" do
    assert_difference('Collection.count') do
      post collections_url, params: { collection: { amount: @collection.amount, balance: @collection.balance, cl_date: @collection.cl_date, fix_amount: @collection.fix_amount, location: @collection.location, name: @collection.name, tag_id: @collection.tag_id } }
    end

    assert_redirected_to collection_url(Collection.last)
  end

  test "should show collection" do
    get collection_url(@collection)
    assert_response :success
  end

  test "should get edit" do
    get edit_collection_url(@collection)
    assert_response :success
  end

  test "should update collection" do
    patch collection_url(@collection), params: { collection: { amount: @collection.amount, balance: @collection.balance, cl_date: @collection.cl_date, fix_amount: @collection.fix_amount, location: @collection.location, name: @collection.name, tag_id: @collection.tag_id } }
    assert_redirected_to collection_url(@collection)
  end

  test "should destroy collection" do
    assert_difference('Collection.count', -1) do
      delete collection_url(@collection)
    end

    assert_redirected_to collections_url
  end
end
