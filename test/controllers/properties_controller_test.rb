require 'test_helper'

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property = properties(:one)
  end

  test "should get index" do
    get properties_url
    assert_response :success
  end

  test "should get new" do
    get new_property_url
    assert_response :success
  end

  test "should create property" do
    assert_difference('Property.count') do
      post properties_url, params: { property: { address: @property.address, city: @property.city, city_location_photo: @property.city_location_photo, country: @property.country, cover_photo: @property.cover_photo, description: @property.description, facilities: @property.facilities, featured: @property.featured, floor_plan_photos: @property.floor_plan_photos, galery_photos: @property.galery_photos, holding_type: @property.holding_type, main_photo: @property.main_photo, price: @property.price, project_code: @property.project_code, project_name: @property.project_name, property_code: @property.property_code, property_name: @property.property_name, province: @property.province } }
    end

    assert_redirected_to property_url(Property.last)
  end

  test "should show property" do
    get property_url(@property)
    assert_response :success
  end

  test "should get edit" do
    get edit_property_url(@property)
    assert_response :success
  end

  test "should update property" do
    patch property_url(@property), params: { property: { address: @property.address, city: @property.city, city_location_photo: @property.city_location_photo, country: @property.country, cover_photo: @property.cover_photo, description: @property.description, facilities: @property.facilities, featured: @property.featured, floor_plan_photos: @property.floor_plan_photos, galery_photos: @property.galery_photos, holding_type: @property.holding_type, main_photo: @property.main_photo, price: @property.price, project_code: @property.project_code, project_name: @property.project_name, property_code: @property.property_code, property_name: @property.property_name, province: @property.province } }
    assert_redirected_to property_url(@property)
  end

  test "should destroy property" do
    assert_difference('Property.count', -1) do
      delete property_url(@property)
    end

    assert_redirected_to properties_url
  end
end
