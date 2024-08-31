require "application_system_test_case"

class MediaTest < ApplicationSystemTestCase
  setup do
    @medium = media(:one)
  end

  test "visiting the index" do
    visit media_url
    assert_selector "h1", text: "Media"
  end

  test "should create medium" do
    visit media_url
    click_on "New medium"

    fill_in "Date completed", with: @medium.date_completed
    fill_in "Date started", with: @medium.date_started
    fill_in "Link", with: @medium.link
    fill_in "Name", with: @medium.name
    fill_in "Platform", with: @medium.platform
    fill_in "Progress", with: @medium.progress
    fill_in "Release date", with: @medium.release_date
    fill_in "Thoughts", with: @medium.thoughts
    fill_in "Type", with: @medium.type
    click_on "Create Medium"

    assert_text "Medium was successfully created"
    click_on "Back"
  end

  test "should update Medium" do
    visit medium_url(@medium)
    click_on "Edit this medium", match: :first

    fill_in "Date completed", with: @medium.date_completed
    fill_in "Date started", with: @medium.date_started
    fill_in "Link", with: @medium.link
    fill_in "Name", with: @medium.name
    fill_in "Platform", with: @medium.platform
    fill_in "Progress", with: @medium.progress
    fill_in "Release date", with: @medium.release_date
    fill_in "Thoughts", with: @medium.thoughts
    fill_in "Type", with: @medium.type
    click_on "Update Medium"

    assert_text "Medium was successfully updated"
    click_on "Back"
  end

  test "should destroy Medium" do
    visit medium_url(@medium)
    click_on "Destroy this medium", match: :first

    assert_text "Medium was successfully destroyed"
  end
end
