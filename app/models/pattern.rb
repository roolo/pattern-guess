class Pattern < ActiveRecord::Base
  serialize :content
  serialize :guess_content
end
