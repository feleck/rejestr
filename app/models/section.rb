class Section < ActiveRecord::Base
  before_save { self.long_name = long_name.downcase }
  before_save { self.short_name = short_name.downcase }
  validates :long_name, presence: true, length: { maximum: 20 }, uniqueness: { case_sensitive: false }
  validates :short_name, presence: true, length: { in: 2..3 }, uniqueness: { case_sensitive: false }
end

