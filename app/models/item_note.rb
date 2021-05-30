# frozen_string_literal: true

class ItemNote < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :item

  has_many :notifications, as: :notifiable
end
