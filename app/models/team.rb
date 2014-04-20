class Team < ActiveRecord::Base
  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug

  before_validation :set_slug

  has_many :users, dependent: :destroy
  has_many :user_seasons, dependent: :destroy

  def set_slug
    self.slug = name.to_s.gsub(' ', '-').downcase
  end
end
