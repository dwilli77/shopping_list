# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notifications, foreign_key: :recipient_id

  has_many :created_items, foreign_key: 'creator_id', class_name: 'Item'
  has_many :managed_items, foreign_key: 'manager_id', class_name: 'Item'

  has_many :item_notes, foreign_key: 'author_id'
end
