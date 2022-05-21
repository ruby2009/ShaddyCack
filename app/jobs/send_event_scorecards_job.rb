class SendEventScorecardsJob < ApplicationJob
  queue_as :default

  def perform(event_id)
    event = Event.find(event_id)
    event.players.each do |player|
      SendScorecardJob.perform_later(player.id, event_id)
    end
  end
end
