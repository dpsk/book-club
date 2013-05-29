class Book < ActiveRecord::Base
  attr_accessible :cover_url, :author, :genre, :name, :notes, :user_id

  belongs_to :user
  has_many :votes

  validates :name, presence: true, uniqueness: true
  validates :cover_url, :format => URI::regexp(%w(http https))
  validates :author, presence: true
  validates :user_id, presence: true

  def added_by user
    user_id == user.id
  end

  def voted_by user
    votes.map(&:user_id).include? user.id
  end

  def vote_by user
    votes.where(user_id: user.id).first
  end

end
