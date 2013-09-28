class Pattern < ActiveRecord::Base
  EMPTY_PATTERN = [
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
  ]

  serialize :content
  serialize :guess_state

  after_initialize :init_patterns

  private
    def init_patterns
      self.content      ||= EMPTY_PATTERN
      self.guess_state  ||= EMPTY_PATTERN
    end


end
