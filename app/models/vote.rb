class Vote < ApplicationRecord
  belongs_to :poop

  validate :cannot_vote_twice_within_an_hour

  def cannot_vote_twice_within_an_hour
    recents = Vote.get_recent
    if recents.length > 0
      recents.each do |vote|
        if vote.user_id == self.user_id
          errors.add(:timing, " - Can't vote twice in an hour! You should get that shit checked out.")
        end
      end
    end
  end

  def self.get_recent
    self.where("created_at > ?", (Time.now - (60*60)))
  end
end
