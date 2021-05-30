# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :manager, class_name: 'User', optional: true

  has_many :item_notes

  has_many :notifications, as: :notifiable
end
