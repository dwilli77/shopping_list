# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :recipient, class_name: 'User'
  belongs_to :actor, class_name: 'User'
  belongs_to :notifiable, polymorphic: true

  scope :unread, -> { where(read_at: nil) }
  scope :recent, -> { order(created_at: :desc).limit(5) }

  def self.post(from:, notifiable:)
    recipients = User.where.not(user_id: from.id)
    notifications = []
    Notification.transaction do
      notifications = recipients.each do |recipient|
        Notification.find_or_create_by!(
          notifiable: notifiable,
          recipient: recipient,
          actor: from
        )
      end
    end
    notifications
  end
end
