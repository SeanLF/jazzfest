# frozen_string_literal: true

require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url
    assert_response :success
  end

  test "should get new" do
    get new_event_url
    assert_response :success
  end

  test "should create event" do
    assert_difference("Event.count") do
      post events_url, params: { event: { active: @event.active, end_date: @event.end_date, name: @event.name, registration_end_date: @event.registration_end_date, registration_start_date: @event.registration_start_date, start_date: @event.start_date } }
    end

    assert_redirected_to event_url(Event.last)
  end

  test "should show event" do
    get event_url(@event)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_url(@event)
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { active: @event.active, end_date: @event.end_date, name: @event.name, registration_end_date: @event.registration_end_date, registration_start_date: @event.registration_start_date, start_date: @event.start_date } }
    assert_redirected_to event_url(@event)
  end

  test "should destroy event" do
    assert_difference("Event.count", -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
