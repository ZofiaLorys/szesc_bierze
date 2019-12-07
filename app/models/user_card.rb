# frozen_string_literal: true

class UserCard < ApplicationRecord
  belongs_to :user
  belongs_to :card
end
