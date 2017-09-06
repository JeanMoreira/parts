require 'test_helper'

class PartPromotionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @part_promotion = part_promotions(:one)
  end

  test "should get index" do
    get part_promotions_url
    assert_response :success
  end

  test "should get new" do
    get new_part_promotion_url
    assert_response :success
  end

  test "should create part_promotion" do
    assert_difference('PartPromotion.count') do
      post part_promotions_url, params: { part_promotion: { company_part_id: @part_promotion.company_part_id, needed_buy: @part_promotion.needed_buy, price_cents: @part_promotion.price_cents, stock_quantity: @part_promotion.stock_quantity } }
    end

    assert_redirected_to part_promotion_url(PartPromotion.last)
  end

  test "should show part_promotion" do
    get part_promotion_url(@part_promotion)
    assert_response :success
  end

  test "should get edit" do
    get edit_part_promotion_url(@part_promotion)
    assert_response :success
  end

  test "should update part_promotion" do
    patch part_promotion_url(@part_promotion), params: { part_promotion: { company_part_id: @part_promotion.company_part_id, needed_buy: @part_promotion.needed_buy, price_cents: @part_promotion.price_cents, stock_quantity: @part_promotion.stock_quantity } }
    assert_redirected_to part_promotion_url(@part_promotion)
  end

  test "should destroy part_promotion" do
    assert_difference('PartPromotion.count', -1) do
      delete part_promotion_url(@part_promotion)
    end

    assert_redirected_to part_promotions_url
  end
end
