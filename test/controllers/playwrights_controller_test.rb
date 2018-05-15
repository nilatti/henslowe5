require 'test_helper'

class PlaywrightsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @playwright = playwrights(:one)
    @user = users(:one)
    @token = TokiToki.encode(@user.login)
  end

  test "should get index" do
    get playwrights_url, params: { token: @token }
    assert_response :success
  end

  test "should create playwright" do
    assert_difference('Playwright.count') do
      post playwrights_url, params: { token: @token, playwright: { bio: @playwright.bio, birth_date: @playwright.birth_date, country_of_origin: @playwright.country_of_origin, death_date: @playwright.death_date, first_name: @playwright.first_name, last_name: @playwright.last_name } }, as: :json
    end

    assert_response 201
  end

  test "should show playwright" do
    get playwright_url(@playwright), params: { token: @token }
    assert_response :success
  end

  test "should update playwright" do
    patch playwright_url(@playwright), params: { token: @token, playwright: { bio: @playwright.bio, birth_date: @playwright.birth_date, country_of_origin: @playwright.country_of_origin, death_date: @playwright.death_date, first_name: @playwright.first_name, last_name: @playwright.last_name } }, as: :json
    assert_response 200
  end

  test "should destroy playwright" do
    assert_difference('Playwright.count', -1) do
      delete playwright_url(@playwright), params: { token: @token }
    end

    assert_response 204
  end
end
