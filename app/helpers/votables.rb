module Votables
  def score
    self.votes.map { |vote| vote.up_down }.inject(:+)
  end
end
