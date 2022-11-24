class Notification < ApplicationRecord
  belongs_to :project

  has_many :recipient_copies, class: "NotificationRecipientCopy"

  validates_presence_of :title
  validates_presence_of :text
  validates_presence_of :recipient_emails
end
