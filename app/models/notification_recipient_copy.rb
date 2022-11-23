class NotificationRecipientCopy < ApplicationRecord
  belongs_to :recipient
  belongs_to :email
end
