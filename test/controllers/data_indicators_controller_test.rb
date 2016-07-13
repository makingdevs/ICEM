require 'test_helper'

class DataIndicatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @data_indicator = data_indicators(:one)
  end

  test "should get index" do
    get data_indicators_url
    assert_response :success
  end

  test "should get new" do
    get new_data_indicator_url
    assert_response :success
  end

  test "should create data_indicator" do
    assert_difference('DataIndicator.count') do
      post data_indicators_url, params: { data_indicator: { category: @data_indicator.category, federal_entity: @data_indicator.federal_entity, indicator: @data_indicator.indicator, main_category: @data_indicator.main_category, subcategory: @data_indicator.subcategory, unit_of_measurement: @data_indicator.unit_of_measurement, year: @data_indicator.year } }
    end

    assert_redirected_to data_indicator_url(DataIndicator.last)
  end

  test "should show data_indicator" do
    get data_indicator_url(@data_indicator)
    assert_response :success
  end

  test "should get edit" do
    get edit_data_indicator_url(@data_indicator)
    assert_response :success
  end

  test "should update data_indicator" do
    patch data_indicator_url(@data_indicator), params: { data_indicator: { category: @data_indicator.category, federal_entity: @data_indicator.federal_entity, indicator: @data_indicator.indicator, main_category: @data_indicator.main_category, subcategory: @data_indicator.subcategory, unit_of_measurement: @data_indicator.unit_of_measurement, year: @data_indicator.year } }
    assert_redirected_to data_indicator_url(@data_indicator)
  end

  test "should destroy data_indicator" do
    assert_difference('DataIndicator.count', -1) do
      delete data_indicator_url(@data_indicator)
    end

    assert_redirected_to data_indicators_url
  end
end
