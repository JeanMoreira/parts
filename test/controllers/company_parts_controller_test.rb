require 'test_helper'

class CompanyPartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_part = company_parts(:one)
  end

  test "should get index" do
    get company_parts_url
    assert_response :success
  end

  test "should get new" do
    get new_company_part_url
    assert_response :success
  end

  test "should create company_part" do
    assert_difference('CompanyPart.count') do
      post company_parts_url, params: { company_part: { company_id: @company_part.company_id, part_id: @company_part.part_id } }
    end

    assert_redirected_to company_part_url(CompanyPart.last)
  end

  test "should show company_part" do
    get company_part_url(@company_part)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_part_url(@company_part)
    assert_response :success
  end

  test "should update company_part" do
    patch company_part_url(@company_part), params: { company_part: { company_id: @company_part.company_id, part_id: @company_part.part_id } }
    assert_redirected_to company_part_url(@company_part)
  end

  test "should destroy company_part" do
    assert_difference('CompanyPart.count', -1) do
      delete company_part_url(@company_part)
    end

    assert_redirected_to company_parts_url
  end
end
