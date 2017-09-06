require 'test_helper'

class PartDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @part_detail = part_details(:one)
  end

  test "should get index" do
    get part_details_url
    assert_response :success
  end

  test "should get new" do
    get new_part_detail_url
    assert_response :success
  end

  test "should create part_detail" do
    assert_difference('PartDetail.count') do
      post part_details_url, params: { part_detail: { company_part_id: @part_detail.company_part_id, negotiabel: @part_detail.negotiabel, price_cents: @part_detail.price_cents, quantity: @part_detail.quantity } }
    end

    assert_redirected_to part_detail_url(PartDetail.last)
  end

  test "should show part_detail" do
    get part_detail_url(@part_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_part_detail_url(@part_detail)
    assert_response :success
  end

  test "should update part_detail" do
    patch part_detail_url(@part_detail), params: { part_detail: { company_part_id: @part_detail.company_part_id, negotiabel: @part_detail.negotiabel, price_cents: @part_detail.price_cents, quantity: @part_detail.quantity } }
    assert_redirected_to part_detail_url(@part_detail)
  end

  test "should destroy part_detail" do
    assert_difference('PartDetail.count', -1) do
      delete part_detail_url(@part_detail)
    end

    assert_redirected_to part_details_url
  end
end
