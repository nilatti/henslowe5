require 'test_helper'

class ProductionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @production = productions(:one)
    @user = users(:one)
    @token = TokiToki.encode(@user.login)
  end

  test "should get index" do
    get productions_url, params: { token: @token }
    assert_response :success
  end

  test "should create production" do
    assert_difference('Production.count') do
      post productions_url, params: { token: @token, production: { play_id: @production.play_id, theater_id: @production.theater_id } }, as: :json
    end

    assert_response 201
  end

  test "should show production" do
    get production_url(@production), params: { token: @token }
    assert_response :success
  end

  test "should update production" do
    patch production_url(@production), params: { token: @token, production: { play_id: @production.play_id, theater_id: @production.theater_id } }, as: :json
    assert_response 200
  end

  test "should destroy production" do
    assert_difference('Production.count', -1) do
      delete production_url(@production), params: { token: @token }
    end

    assert_response 204
  end
end
