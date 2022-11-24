class User < ApplicationRecord
  has_many :recipient_copies, class: "NotificationRecipientCopy"
end
