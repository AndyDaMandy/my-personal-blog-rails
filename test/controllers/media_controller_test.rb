require "test_helper"

class MediaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medium = media(:one)
  end

  test "should get index" do
    get media_url
    assert_response :success
  end

  test "should get new" do
    get new_medium_url
    assert_response :success
  end

  test "should create medium" do
    assert_difference("Medium.count") do
      post media_url, params: { medium: { date_completed: @medium.date_completed, date_started: @medium.date_started, link: @medium.link, name: @medium.name, platform: @medium.platform, progress: @medium.progress, release_date: @medium.release_date, thoughts: @medium.thoughts, type: @medium.type } }
    end

    assert_redirected_to medium_url(Medium.last)
  end

  test "should show medium" do
    get medium_url(@medium)
    assert_response :success
  end

  test "should get edit" do
    get edit_medium_url(@medium)
    assert_response :success
  end

  test "should update medium" do
    patch medium_url(@medium), params: { medium: { date_completed: @medium.date_completed, date_started: @medium.date_started, link: @medium.link, name: @medium.name, platform: @medium.platform, progress: @medium.progress, release_date: @medium.release_date, thoughts: @medium.thoughts, type: @medium.type } }
    assert_redirected_to medium_url(@medium)
  end

  test "should destroy medium" do
    assert_difference("Medium.count", -1) do
      delete medium_url(@medium)
    end

    assert_redirected_to media_url
  end
end
