class Tweet < ActiveRecord::Base

  belongs_to :user

  def is_it_valid?
    self.text.present? && self.user.present?
  end

end
