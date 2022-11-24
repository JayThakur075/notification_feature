class Notification < ApplicationRecord
  belongs_to :project

  has_many :recipient_copies, class: "NotificationRecipientCopy"

  validates_presence_of :title
  validates_presence_of :text
  validates_presence_of :recipient_emails

  before_create :associate_recipients
  after_commit :deliver, :on => :create

  attr_accessor :recipient_emails

  def associate_recipients
    recipient_emails.each do |recipient_email|
      recipient = User.where(email: recipient_email).first
      unless recipient
        recipient = User.create(recipient_email: recipient_email).
      end

      recipients << recipient
    end
  end

  def deliver
    recipients.each do |recipient|
      recipient_notification_copy = RecipientNotificationCopy.create(
        notification: notification
        recipient: recipient,
      )
    end
  end
end
