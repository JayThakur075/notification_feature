class Email < ApplicationCable::Channel
  def initialize(notification_recipient_copy)
    @notification_recipient_copy = notification_recipient_copy
  end

  def deliver
    mail.deliver
  end

  def mail
    Mail.new do
      from "notifications@notification.io"
      to @notification_recipient_copy.recipient.email
      subject @notification_recipient_copy.title
      body @notification_recipient_copy.text
    end
  end
end
