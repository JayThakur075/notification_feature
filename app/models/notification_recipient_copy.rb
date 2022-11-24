require "lib/channels/email"
require "lib/channels/in_app_notification_center"

class NotificationRecipientCopy < ApplicationRecord
  belongs_to :user
  belongs_to :recipient, :class => "User"

  after_create :deliver

  def deliver
    channels.each do |channel_class|
      channel_class.new(self).deliver
    end
  end

  private

  def channels
    [Channels::Email, Channels::InAppNotificationCenter]
  end
end
