# frozen_string_literal: true

class TemporaryCardPlace < ApplicationRecord
    belongs_to :user
    belongs_to :card
end
  