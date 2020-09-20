class NotificationJob < ApplicationJob
  queue_as :default

  def perform(event)
    ActionCable.server.broadcast 'notification_channel', message: event
  end
end
