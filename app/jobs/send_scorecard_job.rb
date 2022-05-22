class SendScorecardJob < ApplicationJob
  include Rails.application.routes.url_helpers

  queue_as :default

  def perform(player_id, event_id)
    player = Player.find(player_id)
    player_phone = player.twilio_style_phone_number
    event = Event.find(event_id)
    course_name = event.course.name
    player_event = PlayerEvent.find_by(player_id: player_id, event_id: event_id)
    message = "Hi #{player.name}, Here's your scorecard for #{event.name} at #{course_name}: #{scorecard_url(id: player_event.to_sgid(for: "sharing").to_s)}"
    player_event.build_scorecard

    account_sid = ENV["TWILIO_ACCOUNT_SSID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @client.messages.create(
      from: ENV["TWILIO_PHONE_NUMBER"],
      to: player_phone,
      body: message
    )
  end
end
