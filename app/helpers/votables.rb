module Votables
  def score
    return 0 if self.votes.count == 0
    self.votes.map { |vote| vote.up_down }.inject(:+)
  end
end
