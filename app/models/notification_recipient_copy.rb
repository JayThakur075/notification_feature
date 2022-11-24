class NotificationRecipientCopy < ApplicationRecord
  belongs_to :user
  belongs_to :recipient, :class => "User"
end
