class User < ActiveRecord::Base

  has_many :tweets

  def is_it_valid?
    self.nil? && self.pass == self.pass2 && self.pass.present?
  end

end
