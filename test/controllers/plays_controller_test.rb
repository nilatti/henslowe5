require 'test_helper'

class PlaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @play = plays(:one)
    @user = users(:one)
    @token = TokiToki.encode(@user.login)
  end

  test "should get index" do
    get plays_url, params: { token: @token }
    assert_response :success
  end

  test "should create play" do
    assert_difference('Play.count') do
      post plays_url, params: {
        token: @token,
        play: {
          playwright_id: @play.playwright_id, summary: @play.summary, title: @play.title, year: @play.year
        }
      },
      as: :json
    end

    assert_response 201
  end

  test "should show play" do
    get play_url(@play), params: { token: @token }
    assert_response :success
  end

  test "should update play" do
    patch play_url(@play), params: { token: @token, play: { playwright_id: @play.playwright_id, summary: @play.summary, title: @play.title, year: @play.year } }, as: :json
    assert_response 200
  end

  test "should destroy play" do
    assert_difference('Play.count', -1) do
      delete play_url(@play), params: { token: @token }
    end

    assert_response 204
  end
end
